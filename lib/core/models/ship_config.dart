/// Represents detected ship information stored in SharedPreferences
class ShipConfig {
  final String shipName;
  final DateTime detectedAt;

  const ShipConfig({
    required this.shipName,
    required this.detectedAt,
  });

  static const List<String> knownShips = [
    'cosma',
    'vita',
    'sol',
    'qube',
    'prima',
    'nova',
    'mira',
    'mar',
    'luna',
    'diva',
    'cara',
    'blu',
    'bella',
    'stella',
    'perla',
    'aura',
  ];

  bool get isExpired =>
      DateTime.now().difference(detectedAt).inHours >= 12;

  String get portalBase => 'https://bordportal.$shipName.aida.de';
  String get extApiBase => 'https://ext-api.$shipName.aida.de';
  String get chatBase => 'https://chat.$shipName.aida.de';

  static const String prefKey = 'ship_name';
  static const String prefTimestampKey = 'ship_detected_at';
}
