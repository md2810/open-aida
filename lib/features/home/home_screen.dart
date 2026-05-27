import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:intl/intl.dart';
import '../../core/providers/providers.dart';
import '../../core/models/ship_data.dart';
import '../../shared/theme/app_theme.dart';
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
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: cs.surface,
      body: RefreshIndicator(
        color: AppTheme.aidaRed,
        onRefresh: () async => ref.invalidate(shipDataProvider),
        child: shipAsync.when(
          loading: () => const LoadingView(),
          error: (e, _) => ErrorView(
            error: e,
            onRetry: () => ref.invalidate(shipDataProvider),
          ),
          data: (data) => _HomeContent(
            data: data,
            guestName: guest?.firstname,
            onRefresh: () => ref.invalidate(shipDataProvider),
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────

class _HomeContent extends StatelessWidget {
  final ShipDataResponse data;
  final String? guestName;
  final VoidCallback onRefresh;

  const _HomeContent({
    required this.data,
    required this.onRefresh,
    this.guestName,
  });

  @override
  Widget build(BuildContext context) {
    final ship = data.data?.shipData;
    final pos = ship?.position;
    final lat = _parseCoord(pos?.latitude);
    final lng = _parseCoord(pos?.longitude);
    final hasPosition = lat != null && lng != null;
    return CustomScrollView(
      slivers: [
        // ── Gradient header SliverAppBar ──────────────────────────────────
        SliverAppBar(
          expandedHeight: 140,
          pinned: true,
          stretch: true,
          backgroundColor: AppTheme.aidaRed,
          foregroundColor: Colors.white,
          elevation: 0,
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh_rounded, color: Colors.white),
              onPressed: onRefresh,
              tooltip: 'Aktualisieren',
            ),
          ],
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
            title: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  guestName != null
                      ? 'Hallo, $guestName! 👋'
                      : 'OpenAIDA',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'Guten ${_timeGreeting()} an Bord',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.85),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            background: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [AppTheme.aidaRed, Color(0xFF880000)],
                ),
              ),
              child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 24, bottom: 20),
                  child: Opacity(
                    opacity: 0.2,
                    child: Icon(
                      Icons.directions_boat_rounded,
                      size: 100,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),

        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              // ── Map ────────────────────────────────────────────────────
              if (hasPosition) ...[
                _SectionLabel(label: 'Schiffsposition'),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
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
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppTheme.aidaRed,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppTheme.aidaRed.withValues(alpha: 0.5),
                                      blurRadius: 8,
                                    ),
                                  ],
                                ),
                                padding: const EdgeInsets.all(6),
                                child: const Icon(
                                  Icons.directions_boat_rounded,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],

              // ── Ship info grid ─────────────────────────────────────────
              _SectionLabel(label: 'Borddaten'),
              _InfoGrid(ship: ship),
              const SizedBox(height: 20),

              // ── Next port ──────────────────────────────────────────────
              if (ship?.nautic?.nextPort != null) ...[
                _SectionLabel(label: 'Nächster Hafen'),
                _NextPortCard(ship: ship!),
                const SizedBox(height: 20),
              ],

              // ── Weather ────────────────────────────────────────────────
              if (ship?.weatherForecast.isNotEmpty == true) ...[
                _SectionLabel(label: 'Wettervorhersage'),
                _WeatherRow(forecast: ship!.weatherForecast),
              ],
            ]),
          ),
        ),
      ],
    );
  }

  double? _parseCoord(String? raw) => raw == null ? null : double.tryParse(raw);

  String _timeGreeting() {
    final h = DateTime.now().hour;
    if (h < 12) return 'Morgen';
    if (h < 18) return 'Tag';
    return 'Abend';
  }
}

// ─────────────────────────────────────────────────────────────────────────────

class _SectionLabel extends StatelessWidget {
  final String label;
  const _SectionLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        label,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5,
            ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────

class _InfoGrid extends StatelessWidget {
  final ShipDataInner? ship;
  const _InfoGrid({this.ship});

  @override
  Widget build(BuildContext context) {
    final items = [
      (Icons.speed_rounded, 'Geschwindigkeit',
          '${ship?.speed?.overGround ?? '-'} kn'),
      (Icons.explore_rounded, 'Kurs',
          '${ship?.direction?.course ?? '-'}°'),
      (Icons.thermostat_rounded, 'Außentemp.',
          '${ship?.air?.temperature ?? '-'}°C'),
      (Icons.water_rounded, 'Wassertemp.',
          '${ship?.water?.temperature ?? '-'}°C'),
      (Icons.air_rounded, 'Wind',
          '${ship?.wind?.speed ?? '-'} kn ${ship?.wind?.direction ?? ''}'),
      (Icons.wb_sunny_rounded, 'Sonnenuntergang',
          ship?.suntime?.sunset ?? '-'),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 2.2,
      ),
      itemCount: items.length,
      itemBuilder: (context, i) {
        final (icon, label, value) = items[i];
        return _InfoTile(icon: icon, label: label, value: value);
      },
    );
  }
}

class _InfoTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoTile({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        color: cs.surfaceContainerLow,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: cs.outlineVariant.withValues(alpha: 0.5)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: cs.primaryContainer,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, size: 16, color: cs.onPrimaryContainer),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(label, style: tt.bodySmall, maxLines: 1, overflow: TextOverflow.ellipsis),
                Text(
                  value,
                  style: tt.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────

class _NextPortCard extends StatelessWidget {
  final ShipDataInner ship;
  const _NextPortCard({required this.ship});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final nautic = ship.nautic!;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            cs.secondaryContainer,
            cs.secondaryContainer.withValues(alpha: 0.5),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: cs.secondary.withValues(alpha: 0.3)),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: cs.secondary.withValues(alpha: 0.15),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.anchor_rounded, color: cs.secondary, size: 28),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nautic.nextPort!,
                  style: tt.titleMedium?.copyWith(
                    color: cs.onSecondaryContainer,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                if (nautic.etaDate != null)
                  Row(
                    children: [
                      Icon(Icons.schedule_rounded, size: 14,
                          color: cs.onSecondaryContainer.withValues(alpha: 0.7)),
                      const SizedBox(width: 4),
                      Text(
                        'ETA ${nautic.etaDate} ${nautic.etaTime ?? ''}',
                        style: tt.bodySmall?.copyWith(
                          color: cs.onSecondaryContainer.withValues(alpha: 0.8),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────

class _WeatherRow extends StatelessWidget {
  final List<WeatherForecast> forecast;
  const _WeatherRow({required this.forecast});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return SizedBox(
      height: 104,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: forecast.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (_, i) {
          final w = forecast[i];
          return Container(
            width: 80,
            decoration: BoxDecoration(
              color: cs.surfaceContainerLow,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: cs.outlineVariant.withValues(alpha: 0.5)),
            ),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(_weatherIcon(w.weather), size: 26, color: cs.primary),
                const SizedBox(height: 4),
                Text(
                  w.temperature != null ? '${w.temperature}°' : '-',
                  style: tt.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                ),
                if (w.date != null)
                  Text(
                    DateFormat('dd.MM').format(DateTime.parse(w.date!)),
                    style: tt.bodySmall,
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  IconData _weatherIcon(String? weather) {
    switch (weather?.toLowerCase()) {
      case 'sunny':
        return Icons.wb_sunny_rounded;
      case 'cloudy':
        return Icons.cloud_rounded;
      case 'rain':
      case 'rainy':
        return Icons.grain_rounded;
      case 'partly_cloudy':
      case 'partly cloudy':
        return Icons.wb_cloudy_rounded;
      default:
        return Icons.wb_cloudy_rounded;
    }
  }
}
