import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../core/api/aida_api.dart';
import '../../core/api/aida_client.dart';
import '../../core/models/guest.dart';

class AuthService {
  final AidaApi _api;
  final AidaClient _client;
  final FlutterSecureStorage _storage;

  static const String _tokenKey = 'aida_cookie_token';
  static const String _cabinKey = 'aida_cabin';
  static const String _surnameKey = 'aida_surname';
  static const String _pinKey = 'aida_pin';
  static const String _folioKey = 'aida_folio';

  AuthService(this._api, this._client, this._storage);

  /// Logs in and returns the guest on success.
  Future<Guest> login({
    required String cabin,
    required String surname,
    required String pin,
  }) async {
    final response = await _api.authGuest(
      cabin: cabin,
      surname: surname,
      pin: pin,
    );

    if (response.success != true || response.cookieToken == null) {
      throw const AuthException(
          'Login fehlgeschlagen. Bitte prüfe deine Daten.');
    }

    final token = response.cookieToken!;

    // ① Set token in-memory immediately so every subsequent Dio request in
    //   this session gets p_auth injected WITHOUT waiting for SecureStorage.
    _client.setToken(token);

    // ② Persist token for session restoration across app restarts.
    await _storage.write(key: _tokenKey, value: token);
    await _storage.write(key: _cabinKey, value: cabin);
    await _storage.write(key: _surnameKey, value: surname);
    await _storage.write(key: _pinKey, value: pin);
    if (response.guest?.folio != null) {
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
    _client.setToken(null); // clear in-memory token immediately
    await _storage.deleteAll();
  }

  /// Check if a session token exists (for app restart recovery).
  Future<Guest?> restoreSession() async {
    final token = await _storage.read(key: _tokenKey);
    final cabin = await _storage.read(key: _cabinKey);
    final folio = await _storage.read(key: _folioKey);
    final surname = await _storage.read(key: _surnameKey);

    if (token == null || cabin == null || folio == null) return null;

    // Warm in-memory token so the getUserData call has p_auth.
    _client.setToken(token);

    try {
      final resp = await _api.getUserData(cabin: cabin, folio: folio);
      return resp.guest;
    } catch (_) {
      // Session expired – try re-auth
      _client.setToken(null);
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
