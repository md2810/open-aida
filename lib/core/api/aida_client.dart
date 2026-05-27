import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/ship_config.dart';

/// Central Dio client factory for the AIDA API.
/// Handles:
///   - Dynamic base URL from detected ship
///   - Automatic p_auth query parameter injection
///   - 401 → re-auth → retry
///   - Simple 5-minute GET cache (except ship-data)
class AidaClient {
  static const String _tokenKey = 'aida_cookie_token';
  static const String _folioKey = 'aida_folio';

  final FlutterSecureStorage _storage;
  final SharedPreferences _prefs;

  late final Dio _bordPortal;
  late final Dio _extApi;
  late final Dio _chat;

  String? _shipName;

  /// In-memory token: set immediately after login so every subsequent request
  /// gets the token synchronously without waiting for SecureStorage reads.
  String? _cachedToken;

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
      LogInterceptor(requestBody: false, responseBody: false),
    ]);
    return dio;
  }

  void updateShip(String shipName) {
    _shipName = shipName;
    _bordPortal.options.baseUrl = _basePortal;
    _extApi.options.baseUrl = _baseExtApi;
    _chat.options.baseUrl = _baseChat;
  }

  /// Call this immediately after a successful login to make the token
  /// available synchronously for all subsequent requests.
  void setToken(String? token) {
    _cachedToken = token;
  }

  Dio get bordPortal => _bordPortal;
  Dio get extApi => _extApi;
  Dio get chat => _chat;

  Future<String?> getToken() => _storage.read(key: _tokenKey);
  Future<void> saveToken(String token) =>
      _storage.write(key: _tokenKey, value: token);
  Future<void> saveFolio(String folio) =>
      _storage.write(key: _folioKey, value: folio);
  Future<String?> getFolio() => _storage.read(key: _folioKey);
  Future<void> clearAuth() async {
    _cachedToken = null;
    await _storage.delete(key: _tokenKey);
    await _storage.delete(key: _folioKey);
  }
}

/// Injects ?p_auth=TOKEN on every request.
/// Uses the in-memory token from [AidaClient] first (set right after login),
/// then falls back to SecureStorage (handles app-restart session restoration).
class _AuthInterceptor extends Interceptor {
  final FlutterSecureStorage _storage;
  final AidaClient _client;

  static const String _tokenKey = 'aida_cookie_token';

  _AuthInterceptor(this._storage, this._client);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Never inject p_auth on the auth endpoint – the server must create a
    // fresh session ticket without any prior auth context.
    if (options.path.contains('auth-guest')) {
      handler.next(options);
      return;
    }

    // Prefer the fast in-memory token; fall back to persisted token on first
    // request after an app restart (before login re-populates _cachedToken).
    final token =
        _client._cachedToken ?? await _storage.read(key: _tokenKey);
    if (token != null) {
      options.queryParameters['p_auth'] = token;
      // Warm the in-memory cache so subsequent requests skip SecureStorage.
      _client._cachedToken ??= token;
    }
    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401) {
      // Token expired – signal upstream to re-login
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
