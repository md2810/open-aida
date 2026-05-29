import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:intl/intl.dart';
import '../../core/providers/providers.dart';
import '../../core/models/ship_data.dart';
import '../../core/models/itinerary.dart';
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
      if (mounted) ref.invalidate(shipDataProvider);
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
      body: RefreshIndicator(
        color: AppTheme.aidaBlue,
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

// ─── Main content ─────────────────────────────────────────────────────────────

class _HomeContent extends ConsumerWidget {
  final ShipDataResponse data;
  final String? guestName;
  final VoidCallback onRefresh;

  const _HomeContent({
    required this.data,
    required this.onRefresh,
    this.guestName,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ship = data.data?.shipData;
    final itinerary = ref.watch(itineraryProvider).asData?.value;
    final currentPort = _currentPort(itinerary);
    final weather = ship?.weatherForecast.firstOrNull;
    final shipName = (ref.watch(shipNameProvider) ?? 'aida').toUpperCase();

    final lat = double.tryParse(ship?.position?.latitude ?? '');
    final lng = double.tryParse(ship?.position?.longitude ?? '');

    return CustomScrollView(
      slivers: [
        // ── Immersive hero ────────────────────────────────────────────────
        SliverAppBar(
          expandedHeight: 240,
          pinned: true,
          stretch: true,
          backgroundColor: const Color(0xFF1B3F6A),
          foregroundColor: Colors.white,
          elevation: 0,
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.directions_boat_rounded, size: 15, color: Colors.white70),
              const SizedBox(width: 7),
              Text(
                shipName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh_rounded, color: Colors.white),
              onPressed: onRefresh,
              tooltip: 'Aktualisieren',
            ),
          ],
          flexibleSpace: FlexibleSpaceBar(
            background: _HeroPanel(
              guestName: guestName,
              temp: weather?.temperature,
              weatherCode: weather?.weather,
              currentPort: currentPort,
            ),
          ),
        ),

        // ── Body ──────────────────────────────────────────────────────────
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 100),
          sliver: SliverList.list(
            children: [
              // Stats strip
              const SizedBox(height: 16),
              _StatsStrip(ship: ship),
              const SizedBox(height: 20),

              // Map
              if (lat != null && lng != null) ...[
                _MapCard(lat: lat, lng: lng),
                const SizedBox(height: 20),
              ],

              // Next port
              if (ship?.nautic?.nextPort != null) ...[
                _NextPortCard(ship: ship!),
                const SizedBox(height: 20),
              ],

              // Weather forecast
              if ((ship?.weatherForecast.length ?? 0) > 1) ...[
                _Label('Wettervorhersage'),
                const SizedBox(height: 10),
                _WeatherForecastRow(forecast: ship!.weatherForecast),
              ],
            ],
          ),
        ),
      ],
    );
  }

  static ItineraryPort? _currentPort(ItineraryResponse? itinerary) {
    if (itinerary == null) return null;
    final now = DateTime.now();
    for (final port in itinerary.ports) {
      if (port.seaday) continue;
      final raw = port.dateLocalized?.datetimeRaw;
      if (raw == null || raw.length < 8) continue;
      final y = int.tryParse(raw.substring(0, 4));
      final m = int.tryParse(raw.substring(4, 6));
      final d = int.tryParse(raw.substring(6, 8));
      if (y != now.year || m != now.month || d != now.day) continue;
      final depStr = port.departuretimeLocalized?.time;
      if (depStr != null) {
        final parts = depStr.split(':');
        if (parts.length >= 2) {
          final dh = int.tryParse(parts[0]);
          final dm = int.tryParse(parts[1]);
          if (dh != null && dm != null) {
            final depTime = DateTime(now.year, now.month, now.day, dh, dm);
            if (now.isAfter(depTime)) return null;
          }
        }
      }
      return port;
    }
    return null;
  }
}

// ─── Hero panel ───────────────────────────────────────────────────────────────

class _HeroPanel extends StatelessWidget {
  final String? guestName;
  final String? temp;
  final String? weatherCode;
  final ItineraryPort? currentPort;

  const _HeroPanel({
    this.guestName,
    this.temp,
    this.weatherCode,
    this.currentPort,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: AppTheme.gradSea),
      child: Stack(
        children: [
          // Background radial glow
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: const Alignment(0.6, -0.4),
                  radius: 1.2,
                  colors: [
                    Colors.white.withValues(alpha: 0.07),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          // Ship watermark
          Positioned(
            right: -24,
            bottom: -24,
            child: Opacity(
              opacity: 0.07,
              child: const Icon(
                Icons.directions_boat_rounded,
                size: 200,
                color: Colors.white,
              ),
            ),
          ),
          // Main content
          Positioned(
            left: 20,
            right: 20,
            bottom: 24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  guestName != null
                      ? 'Guten ${_greeting()}, $guestName.'
                      : 'OpenAIDA',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.6,
                    height: 1.1,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  'Willkommen an Bord',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.72),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                if (temp != null || currentPort != null) ...[
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      if (temp != null)
                        _HeroChip(
                          icon: _weatherIcon(weatherCode),
                          label: '$temp°C',
                          tint: AppTheme.aidaYellow,
                        ),
                      if (temp != null && currentPort != null)
                        const SizedBox(width: 8),
                      if (currentPort != null)
                        Flexible(
                          child: _HeroChip(
                            icon: Icons.location_on_rounded,
                            label: currentPort?.name ?? '',
                            tint: Colors.white,
                          ),
                        ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _greeting() {
    final h = DateTime.now().hour;
    if (h < 12) return 'Morgen';
    if (h < 18) return 'Tag';
    return 'Abend';
  }

  IconData _weatherIcon(String? code) {
    switch (code?.toLowerCase()) {
      case 'sunny':
        return Icons.wb_sunny_rounded;
      case 'cloudy':
        return Icons.cloud_rounded;
      case 'rain':
      case 'rainy':
        return Icons.grain_rounded;
      default:
        return Icons.wb_cloudy_rounded;
    }
  }
}

class _HeroChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color tint;

  const _HeroChip({required this.icon, required this.label, required this.tint});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.28),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: Colors.white.withValues(alpha: 0.18)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: tint),
          const SizedBox(width: 6),
          Flexible(
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Stats strip ──────────────────────────────────────────────────────────────

class _StatsStrip extends StatelessWidget {
  final ShipDataInner? ship;
  const _StatsStrip({this.ship});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    final stats = <(IconData, String, String?)>[
      (Icons.speed_rounded, 'Geschwindigkeit',
          ship?.speed?.overGround != null ? '${ship!.speed!.overGround} kn' : null),
      (Icons.explore_rounded, 'Kurs',
          ship?.direction?.course != null ? '${ship!.direction!.course}°' : null),
      (Icons.thermostat_rounded, 'Außentemp.',
          ship?.air?.temperature != null ? '${ship!.air!.temperature}°C' : null),
      (Icons.water_rounded, 'Wassertemp.',
          ship?.water?.temperature != null ? '${ship!.water!.temperature}°C' : null),
      (Icons.air_rounded, 'Wind',
          ship?.wind?.speed != null
              ? '${ship!.wind!.speed} kn ${ship!.wind!.direction ?? ''}'.trim()
              : null),
      (Icons.wb_twilight_rounded, 'Sonnenuntergang', ship?.suntime?.sunset),
    ].where((s) => s.$3 != null).toList();

    if (stats.isEmpty) return const SizedBox.shrink();

    return SizedBox(
      height: 74,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: stats.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (_, i) {
          final (icon, label, value) = stats[i];
          return _StatChip(
            icon: icon,
            label: label,
            value: value!,
            cs: cs,
          );
        },
      ),
    );
  }
}

class _StatChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final ColorScheme cs;

  const _StatChip({
    required this.icon,
    required this.label,
    required this.value,
    required this.cs,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 100),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: cs.surfaceContainerLow,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: cs.outlineVariant.withValues(alpha: 0.35)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: AppTheme.aidaBlue),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                value,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: cs.onSurface,
                  letterSpacing: -0.2,
                ),
              ),
              Text(
                label,
                style: TextStyle(
                  fontSize: 10,
                  color: cs.onSurfaceVariant,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─── Map card ─────────────────────────────────────────────────────────────────

class _MapCard extends StatelessWidget {
  final double lat;
  final double lng;
  const _MapCard({required this.lat, required this.lng});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Label('Schiffsposition'),
        const SizedBox(height: 10),
        ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Stack(
            children: [
              SizedBox(
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
                              color: AppTheme.aidaBlue,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: AppTheme.aidaBlue.withValues(alpha: 0.55),
                                  blurRadius: 12,
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.all(7),
                            child: const Icon(
                              Icons.directions_boat_rounded,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Coords badge
              Positioned(
                bottom: 10,
                right: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: cs.surfaceContainerHighest.withValues(alpha: 0.9),
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Text(
                    '${lat.toStringAsFixed(3)}°N  ${lng.toStringAsFixed(3)}°E',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: cs.onSurface,
                      letterSpacing: 0.2,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ─── Next port card ───────────────────────────────────────────────────────────

class _NextPortCard extends StatelessWidget {
  final ShipDataInner ship;
  const _NextPortCard({required this.ship});

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final nautic = ship.nautic!;

    return Container(
      decoration: BoxDecoration(
        gradient: AppTheme.gradSea,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppTheme.aidaBlue.withValues(alpha: 0.3),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(11),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.18),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.anchor_rounded, color: Colors.white, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nächster Hafen',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.72),
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.8,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  nautic.nextPort!,
                  style: tt.titleMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 18,
                  ),
                ),
                if (nautic.etaDate != null) ...[
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        Icons.schedule_rounded,
                        size: 13,
                        color: Colors.white.withValues(alpha: 0.75),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'ETA ${nautic.etaDate}${nautic.etaTime != null ? '  ${nautic.etaTime}' : ''}',
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.85),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
          Icon(Icons.arrow_forward_rounded, color: Colors.white.withValues(alpha: 0.6), size: 20),
        ],
      ),
    );
  }
}

// ─── Weather forecast ─────────────────────────────────────────────────────────

class _WeatherForecastRow extends StatelessWidget {
  final List<WeatherForecast> forecast;
  const _WeatherForecastRow({required this.forecast});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return SizedBox(
      height: 96,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: forecast.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (_, i) {
          final w = forecast[i];
          return Container(
            width: 76,
            decoration: BoxDecoration(
              color: cs.surfaceContainerLow,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: cs.outlineVariant.withValues(alpha: 0.35)),
            ),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  _icon(w.weather),
                  size: 24,
                  color: AppTheme.aidaBlue,
                ),
                const SizedBox(height: 4),
                Text(
                  w.temperature != null ? '${w.temperature}°' : '-',
                  style: tt.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
                ),
                if (w.date != null)
                  Text(
                    _formatDate(w.date!),
                    style: tt.bodySmall?.copyWith(fontSize: 10),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  String _formatDate(String raw) {
    try {
      return DateFormat('dd.MM').format(DateTime.parse(raw));
    } catch (_) {
      return raw;
    }
  }

  IconData _icon(String? code) {
    switch (code?.toLowerCase()) {
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

// ─── Shared ───────────────────────────────────────────────────────────────────

class _Label extends StatelessWidget {
  final String text;
  const _Label(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      style: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w700,
        color: Theme.of(context).colorScheme.onSurfaceVariant,
        letterSpacing: 1.2,
      ),
    );
  }
}
