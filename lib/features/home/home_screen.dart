import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:intl/intl.dart';
import '../../core/providers/providers.dart';
import '../../core/models/ship_data.dart';
import '../../shared/widgets/error_view.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Auto-refresh ship data every 60 seconds
    _timer = Timer.periodic(const Duration(seconds: 60), (_) {
      ref.invalidate(shipDataProvider);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final shipAsync = ref.watch(shipDataProvider);
    final guest = ref.watch(authStateProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('OpenAIDA'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.invalidate(shipDataProvider),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async => ref.invalidate(shipDataProvider),
        child: shipAsync.when(
          loading: () => const LoadingView(),
          error: (e, _) => ErrorView(
            error: e,
            onRetry: () => ref.invalidate(shipDataProvider),
          ),
          data: (data) => _HomeContent(data: data, guestName: guest?.firstname),
        ),
      ),
    );
  }
}

class _HomeContent extends StatelessWidget {
  final ShipDataResponse data;
  final String? guestName;

  const _HomeContent({required this.data, this.guestName});

  @override
  Widget build(BuildContext context) {
    final ship = data.data?.shipData;
    final pos = ship?.position;
    final lat = _parseCoord(pos?.latitude);
    final lng = _parseCoord(pos?.longitude);
    final hasPosition = lat != null && lng != null;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Greeting
        if (guestName != null) ...[
          Text(
            'Hallo, $guestName!',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 4),
          Text(
            'Guten ${_timeGreeting()} an Bord',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 16),
        ],

        // Map
        if (hasPosition) ...[
          Card(
            clipBehavior: Clip.hardEdge,
            child: SizedBox(
              height: 200,
              child: FlutterMap(
                options: MapOptions(
                  initialCenter: LatLng(lat, lng),
                  initialZoom: 6,
                  interactionOptions: const InteractionOptions(
                    flags: InteractiveFlag.pinchZoom | InteractiveFlag.drag,
                  ),
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'de.openaida.app',
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: LatLng(lat, lng),
                        child: const Icon(
                          Icons.directions_boat,
                          color: Color(0xFFCC0000),
                          size: 36,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
        ],

        // Ship info cards
        Row(
          children: [
            Expanded(
              child: _InfoCard(
                icon: Icons.speed,
                label: 'Geschwindigkeit',
                value: '${ship?.speed?.overGround ?? '-'} kn',
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _InfoCard(
                icon: Icons.explore,
                label: 'Kurs',
                value: '${ship?.direction?.course ?? '-'}°',
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: _InfoCard(
                icon: Icons.thermostat,
                label: 'Außentemp.',
                value: '${ship?.air?.temperature ?? '-'}°C',
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _InfoCard(
                icon: Icons.water,
                label: 'Wassertemp.',
                value: '${ship?.water?.temperature ?? '-'}°C',
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: _InfoCard(
                icon: Icons.air,
                label: 'Wind',
                value: '${ship?.wind?.speed ?? '-'} kn ${ship?.wind?.direction ?? ''}',
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _InfoCard(
                icon: Icons.wb_sunny_outlined,
                label: 'Sonnenuntergang',
                value: ship?.suntime?.sunset ?? '-',
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),

        // Next port
        if (ship?.nautic?.nextPort != null) ...[
          Card(
            child: ListTile(
              leading: const Icon(Icons.anchor),
              title: const Text('Nächster Hafen'),
              subtitle: Text(ship!.nautic!.nextPort!),
              trailing: ship.nautic?.etaDate != null
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'ETA',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        Text(
                          '${ship.nautic!.etaDate} ${ship.nautic!.etaTime ?? ''}',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  : null,
            ),
          ),
          const SizedBox(height: 8),
        ],

        // Weather forecast
        if (ship?.weatherForecast.isNotEmpty == true) ...[
          Text(
            'Wettervorhersage',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 100,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: ship!.weatherForecast.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (_, i) {
                final w = ship.weatherForecast[i];
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(_weatherIcon(w.weather), size: 28),
                        const SizedBox(height: 4),
                        Text(w.temperature != null ? '${w.temperature}°C' : '-'),
                        Text(
                          w.date != null
                              ? DateFormat('dd.MM').format(
                                  DateTime.parse(w.date!),
                                )
                              : '',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ],
    );
  }

  double? _parseCoord(String? raw) {
    if (raw == null) return null;
    return double.tryParse(raw);
  }

  String _timeGreeting() {
    final h = DateTime.now().hour;
    if (h < 12) return 'Morgen';
    if (h < 18) return 'Tag';
    return 'Abend';
  }

  IconData _weatherIcon(String? weather) {
    switch (weather?.toLowerCase()) {
      case 'sunny':
        return Icons.wb_sunny;
      case 'cloudy':
        return Icons.cloud;
      case 'rain':
      case 'rainy':
        return Icons.grain;
      default:
        return Icons.wb_cloudy;
    }
  }
}

class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoCard({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Icon(icon, size: 24, color: Theme.of(context).colorScheme.primary),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label,
                      style: Theme.of(context).textTheme.bodySmall),
                  Text(
                    value,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
