import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../core/api/aida_api.dart';
import '../../core/api/aida_client.dart';
import '../../core/models/guest.dart';

class AuthService {
  final AidaApi _api;
  final AidaClient _client;
  final FlutterSecureStorage _storage;

  static const String _cabinKey = 'aida_cabin';
  static const String _surnameKey = 'aida_surname';
  static const String _pinKey = 'aida_pin';
  static const String _folioKey = 'aida_folio';

  AuthService(this._api, this._client, this._storage);

  /// Logs in and returns the guest on success.
  /// Auth flow: auth-guest sets JSESSIONID in Set-Cookie (captured by interceptor),
  /// and returns jwt + sessionToken in JSON. Both are stored for subsequent requests.
  Future<Guest> login({
    required String cabin,
    required String surname,
    required String pin,
  }) async {
    // Clear any stale session so the auth request goes out clean.
    _client.clearSession();

    final response = await _api.authGuest(
      cabin: cabin,
      surname: surname,
      pin: pin,
    );

    if (response.success != true || response.guest == null) {
      throw AuthException(
        response.errorMessages.isNotEmpty
            ? response.errorMessages.first
            : 'Login fehlgeschlagen. Bitte prüfe deine Daten.',
      );
    }

    // At this point, _AuthInterceptor.onResponse has already captured
    // JSESSIONID from the Set-Cookie header into _client.sessionId.
    final jwt = response.jwt;
    final sessionToken = response.sessionToken;

    // Store JWT + sessionToken in memory (JSESSIONID already captured by interceptor).
    _client.setJwtAndToken(jwt: jwt, sessionToken: sessionToken);

    // Persist for session restoration across app restarts.
    await _client.saveSession(
      sessionId: _client.sessionId,
      jwt: jwt,
      sessionToken: sessionToken,
    );
    await _storage.write(key: _cabinKey, value: cabin);
    await _storage.write(key: _surnameKey, value: surname);
    await _storage.write(key: _pinKey, value: pin);
    if (response.guest!.folio != null) {
      await _storage.write(key: _folioKey, value: response.guest!.folio);
    }

    return response.guest!;
  }

  /// Re-authenticates using stored credentials (called on 401).
  Future<bool> reAuth() async {
    final cabin = await _storage.read(key: _cabinKey);
    final surname = await _storage.read(key: _surnameKey);
    final pin = await _storage.read(key: _pinKey);

    if (cabin == null || surname == null) return false;

    try {
      await login(cabin: cabin, surname: surname, pin: pin ?? '');
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<void> logout() async {
    _client.clearSession();
    await _storage.deleteAll();
  }

  /// Check if a session token exists (for app restart recovery).
  Future<Guest?> restoreSession() async {
    final session = await _client.loadSession();
    final cabin = await _storage.read(key: _cabinKey);
    final folio = await _storage.read(key: _folioKey);
    final surname = await _storage.read(key: _surnameKey);

    if (session.sessionId == null || session.jwt == null || cabin == null || folio == null) {
      return null;
    }

    // Warm in-memory session so the getUserData call is authenticated.
    _client.setSession(
      sessionId: session.sessionId,
      jwt: session.jwt,
      sessionToken: session.sessionToken,
    );

    try {
      final resp = await _api.getUserData(cabin: cabin, folio: folio);
      return resp.guest;
    } catch (_) {
      // Session expired – try full re-auth with stored credentials.
      _client.clearSession();
      if (surname != null) {
        try {
          return await login(
            cabin: cabin,
            surname: surname,
            pin: await _storage.read(key: _pinKey) ?? '',
          );
        } catch (_) {}
      }
      return null;
    }
  }
}

class AuthException implements Exception {
  final String message;
  const AuthException(this.message);

  @override
  String toString() => message;
}
