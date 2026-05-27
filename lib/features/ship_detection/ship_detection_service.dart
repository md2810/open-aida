import 'dart:async';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/models/ship_config.dart';

/// Detects which AIDA ship the device is connected to.
///
/// Strategy:
///   1. Check SharedPreferences cache (TTL 12 h)
///   2. Probe ALL known ships IN PARALLEL – first successful response wins
///   3. Persist result with timestamp
///
/// SSID check is intentionally skipped: `network_info_plus` requires
/// ACCESS_FINE_LOCATION on Android 10+ and the SSID is redacted when the
/// permission is denied.  Parallel probing is fast enough (< 5 s on-ship).
class ShipDetectionService {
  final SharedPreferences _prefs;
  final Dio _dio;

  ShipDetectionService(this._prefs)
      : _dio = Dio(BaseOptions(
          connectTimeout: const Duration(seconds: 5),
          receiveTimeout: const Duration(seconds: 5),
        ));

  /// Returns the detected ship name, or throws [ShipDetectionException].
  Future<String> detectShip() async {
    // 1. Cached and not expired?
    final cached = _getCached();
    if (cached != null) return cached;

    // 2. Probe all known ships in parallel – first to respond wins
    final ship = await _probeAllParallel();
    if (ship != null) {
      await _persist(ship);
      return ship;
    }

    throw const ShipDetectionException(
      'Kein AIDA-Schiff erkannt.\n'
      'Bitte stelle sicher, dass du mit dem AIDA-WLAN verbunden bist\n'
      'oder wähle dein Schiff manuell.',
    );
  }

  /// Probes all ships concurrently; resolves with the first reachable one.
  Future<String?> _probeAllParallel() async {
    final completer = Completer<String?>();
    int remaining = ShipConfig.knownShips.length;

    for (final ship in ShipConfig.knownShips) {
      _probeShip(ship).then((reachable) {
        if (reachable && !completer.isCompleted) {
          completer.complete(ship);
        }
      }).whenComplete(() {
        remaining--;
        if (remaining == 0 && !completer.isCompleted) {
          completer.complete(null); // all probes failed
        }
      });
    }

    return completer.future;
  }

  /// Directly set ship (manual override from the UI).
  Future<void> setShipManually(String shipName) async {
    await _persist(shipName);
  }

  String? _getCached() {
    final name = _prefs.getString(ShipConfig.prefKey);
    final ts = _prefs.getInt(ShipConfig.prefTimestampKey);
    if (name == null || ts == null) return null;

    final detectedAt = DateTime.fromMillisecondsSinceEpoch(ts);
    if (DateTime.now().difference(detectedAt).inHours >= 12) return null;

    return name;
  }

  Future<bool> _probeShip(String ship) async {
    try {
      final resp = await _dio.get(
        'https://bordportal.$ship.aida.de/assets/config.json',
      );
      return resp.statusCode == 200;
    } catch (_) {
      return false;
    }
  }

  Future<void> _persist(String shipName) async {
    await _prefs.setString(ShipConfig.prefKey, shipName);
    await _prefs.setInt(
      ShipConfig.prefTimestampKey,
      DateTime.now().millisecondsSinceEpoch,
    );
  }

  void invalidateCache() {
    _prefs.remove(ShipConfig.prefKey);
    _prefs.remove(ShipConfig.prefTimestampKey);
  }
}

class ShipDetectionException implements Exception {
  final String message;
  const ShipDetectionException(this.message);

  @override
  String toString() => message;
}
