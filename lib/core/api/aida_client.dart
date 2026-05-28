import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/ship_config.dart';

/// Central Dio client factory for the AIDA API.
/// Auth flow (confirmed via Proxyman logs of official app):
///   1. Call auth-guest → server sets JSESSIONID in Set-Cookie + returns jwt in JSON
///   2. Subsequent requests: Cookie: JSESSIONID=... + token: <JWT> header
///   3. p_auth query param is NOT needed (sent empty by official app)
class AidaClient {
  static const String _sessionIdKey = 'aida_jsessionid';
  static const String _jwtKey = 'aida_jwt';
  static const String _sessionTokenKey = 'aida_session_token';

  final FlutterSecureStorage _storage;
  final SharedPreferences _prefs;

  late final Dio _bordPortal;
  late final Dio _extApi;
  late final Dio _chat;

  String? _shipName;

  /// In-memory session state: set immediately after login.
  String? _sessionId;  // JSESSIONID cookie value
  String? _jwt;        // JWT for `token` header
  String? _sessionToken; // short session token (sessionToken field) for p_auth on bordportal

  AidaClient(this._storage, this._prefs) {
    _shipName = _prefs.getString(ShipConfig.prefKey);
    _initClients();
  }

  void _initClients() {
    _bordPortal = _buildDio(_basePortal);
    _extApi = _buildDio(_baseExtApi);
    _chat = _buildDio(_baseChat);
  }

  String get _basePortal =>
      'https://bordportal.${_shipName ?? 'cosma'}.aida.de';
  String get _baseExtApi =>
      'https://ext-api.${_shipName ?? 'cosma'}.aida.de';
  String get _baseChat =>
      'https://chat.${_shipName ?? 'cosma'}.aida.de';

  Dio _buildDio(String baseUrl) {
    final dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 30),
    ));
    dio.interceptors.addAll([
      _AuthInterceptor(_storage, this),
      _CacheInterceptor(),
      LogInterceptor(requestBody: true, responseBody: true),
    ]);
    return dio;
  }

  void updateShip(String shipName) {
    _shipName = shipName;
    _bordPortal.options.baseUrl = _basePortal;
    _extApi.options.baseUrl = _baseExtApi;
    _chat.options.baseUrl = _baseChat;
  }

  // Public read-only access to current session values.
  String? get sessionId => _sessionId;
  String? get jwt => _jwt;
  String? get sessionToken => _sessionToken;

  /// Called after a successful login with JWT + sessionToken.
  /// JSESSIONID is captured automatically by the interceptor's onResponse.
  void setJwtAndToken({required String? jwt, required String? sessionToken}) {
    _jwt = jwt;
    _sessionToken = sessionToken;
  }

  /// Restores a full session (app restart recovery).
  void setSession({
    required String? sessionId,
    required String? jwt,
    required String? sessionToken,
  }) {
    _sessionId = sessionId;
    _jwt = jwt;
    _sessionToken = sessionToken;
  }

  /// Clears all session state (logout or pre-login).
  void clearSession() {
    _sessionId = null;
    _jwt = null;
    _sessionToken = null;
  }

  Dio get bordPortal => _bordPortal;
  Dio get extApi => _extApi;
  Dio get chat => _chat;

  Future<void> saveSession({
    required String? sessionId,
    required String? jwt,
    required String? sessionToken,
  }) async {
    if (sessionId != null) await _storage.write(key: _sessionIdKey, value: sessionId);
    if (jwt != null) await _storage.write(key: _jwtKey, value: jwt);
    if (sessionToken != null) await _storage.write(key: _sessionTokenKey, value: sessionToken);
  }

  Future<({String? sessionId, String? jwt, String? sessionToken})> loadSession() async {
    return (
      sessionId: await _storage.read(key: _sessionIdKey),
      jwt: await _storage.read(key: _jwtKey),
      sessionToken: await _storage.read(key: _sessionTokenKey),
    );
  }

  Future<void> clearAuth() async {
    clearSession();
    await _storage.deleteAll();
  }
}

/// Injects JSESSIONID (Cookie header) and JWT (token header) on every
/// authenticated request, mirroring the official AIDA app's native auth pattern.
/// Also captures JSESSIONID from auth-guest Set-Cookie responses.
class _AuthInterceptor extends Interceptor {
  final FlutterSecureStorage _storage;
  final AidaClient _client;

  static const String _sessionIdKey = 'aida_jsessionid';
  static const String _jwtKey = 'aida_jwt';

  _AuthInterceptor(this._storage, this._client);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Never inject auth on the auth endpoint itself.
    if (options.path.contains('auth-guest')) {
      handler.next(options);
      return;
    }

    // Use in-memory values first; fall back to persisted values (app restart).
    final sessionId = _client._sessionId ?? await _storage.read(key: _sessionIdKey);
    final jwt = _client._jwt ?? await _storage.read(key: _jwtKey);

    if (sessionId != null) {
      options.headers['Cookie'] = 'JSESSIONID=$sessionId';
      _client._sessionId ??= sessionId;
    }
    if (jwt != null) {
      options.headers['token'] = jwt;
      _client._jwt ??= jwt;
    }

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // Capture JSESSIONID from the auth-guest response Set-Cookie header.
    if (response.requestOptions.path.contains('auth-guest')) {
      final setCookies = response.headers.map['set-cookie'] ?? [];
      for (final cookie in setCookies) {
        if (cookie.contains('JSESSIONID=')) {
          // Cookie format: "JSESSIONID=VALUE; Path=/; ..."
          final parts = cookie.split(';');
          for (final part in parts) {
            final trimmed = part.trim();
            if (trimmed.startsWith('JSESSIONID=')) {
              _client._sessionId = trimmed.substring('JSESSIONID='.length);
              break;
            }
          }
        }
      }
    }
    handler.next(response);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401) {
      handler.reject(err);
      return;
    }
    handler.next(err);
  }
}

/// Simple in-memory GET cache with 5-minute TTL.
/// Ship-data endpoint is excluded (refreshed every 60s by the widget).
class _CacheInterceptor extends Interceptor {
  final Map<String, _CacheEntry> _cache = {};
  static const _excludePatterns = ['get-ship-data'];

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    if (options.method != 'GET') {
      handler.next(options);
      return;
    }
    final path = options.path;
    if (_excludePatterns.any((p) => path.contains(p))) {
      handler.next(options);
      return;
    }
    final key = _cacheKey(options);
    final entry = _cache[key];
    if (entry != null && !entry.isExpired) {
      handler.resolve(
        Response(
          requestOptions: options,
          data: entry.data,
          statusCode: 200,
        ),
      );
      return;
    }
    handler.next(options);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    if (response.requestOptions.method == 'GET' &&
        response.statusCode == 200) {
      final path = response.requestOptions.path;
      if (!_excludePatterns.any((p) => path.contains(p))) {
        _cache[_cacheKey(response.requestOptions)] =
            _CacheEntry(response.data);
      }
    }
    handler.next(response);
  }

  String _cacheKey(RequestOptions options) =>
      '${options.baseUrl}${options.path}';
}

class _CacheEntry {
  final dynamic data;
  final DateTime createdAt;

  _CacheEntry(this.data) : createdAt = DateTime.now();

  bool get isExpired =>
      DateTime.now().difference(createdAt) > const Duration(minutes: 5);
}
