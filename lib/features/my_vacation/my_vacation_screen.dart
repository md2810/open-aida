import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../core/providers/providers.dart';
import '../../core/models/timetable.dart';
import '../../core/models/itinerary.dart';
import '../../core/models/excursion.dart';
import '../../shared/theme/app_theme.dart';
import '../../shared/widgets/error_view.dart';

class MyVacationScreen extends ConsumerWidget {
  const MyVacationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: NestedScrollView(
          headerSliverBuilder: (context, _) => [
            SliverAppBar(
              expandedHeight: 120,
              pinned: true,
              stretch: true,
              backgroundColor: AppTheme.aidaRed,
              foregroundColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: const EdgeInsets.fromLTRB(20, 0, 20, 56),
                title: const Text(
                  'Mein Urlaub',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
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
                      padding: const EdgeInsets.only(right: 24),
                      child: Opacity(
                        opacity: 0.2,
                        child: Icon(
                          Icons.beach_access_rounded,
                          size: 90,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              bottom: const TabBar(
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white70,
                indicatorColor: Colors.white,
                indicatorWeight: 3,
                tabs: [
                  Tab(icon: Icon(Icons.event_note_rounded, size: 18), text: 'Termine'),
                  Tab(icon: Icon(Icons.map_rounded, size: 18), text: 'Route'),
                  Tab(icon: Icon(Icons.explore_rounded, size: 18), text: 'Ausflüge'),
                ],
              ),
            ),
          ],
          body: const TabBarView(
            children: [
              _TimetableTab(),
              _ItineraryTab(),
              _ExcursionsTab(),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Timetable Tab ────────────────────────────────────────────────────────────

class _TimetableTab extends ConsumerWidget {
  const _TimetableTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shipName = ref.watch(shipNameProvider) ?? 'cosma';
    final baseUrl = 'https://bordportal.$shipName.aida.de';

    return ref.watch(timetableProvider).when(
          loading: () => const LoadingView(),
          error: (e, _) => ErrorView(
            error: e,
            onRetry: () => ref.invalidate(timetableProvider),
          ),
          data: (resp) {
            if (resp.timetableList.isEmpty) {
              return _EmptyState(
                icon: Icons.event_busy_rounded,
                message: 'Keine Buchungen vorhanden',
              );
            }
            return ListView.builder(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 100),
              itemCount: resp.timetableList.length,
              itemBuilder: (_, i) => _TimetableCard(
                entry: resp.timetableList[i],
                baseUrl: baseUrl,
              ),
            );
          },
        );
  }
}

class _TimetableCard extends StatelessWidget {
  final TimetableEntry entry;
  final String baseUrl;

  const _TimetableCard({required this.entry, required this.baseUrl});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final icon = _itemTypeIcon(entry.itemType);

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: cs.surfaceContainerLow,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: cs.outlineVariant.withValues(alpha: 0.5)),
      ),
      child: Row(
        children: [
          // Left accent bar + icon
          Container(
            width: 56,
            decoration: BoxDecoration(
              color: cs.primaryContainer,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(14),
                bottomLeft: Radius.circular(14),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 16),
                entry.image != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: CachedNetworkImage(
                          imageUrl: '$baseUrl${entry.image}',
                          width: 36,
                          height: 36,
                          fit: BoxFit.cover,
                          errorWidget: (_, __, ___) => Icon(icon,
                              color: cs.onPrimaryContainer, size: 24),
                        ),
                      )
                    : Icon(icon, color: cs.onPrimaryContainer, size: 24),
                const SizedBox(height: 16),
              ],
            ),
          ),
          // Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    entry.eventName ?? '',
                    style: tt.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  if (entry.dateTimeLocalized?.datetime != null)
                    Row(
                      children: [
                        Icon(Icons.access_time_rounded, size: 13, color: cs.primary),
                        const SizedBox(width: 4),
                        Text(
                          entry.dateTimeLocalized!.datetime!,
                          style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
                        ),
                      ],
                    ),
                  if (entry.location != null) ...[
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Icon(Icons.place_rounded, size: 13, color: cs.primary),
                        const SizedBox(width: 4),
                        Text(
                          entry.location!,
                          style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
                        ),
                      ],
                    ),
                  ],
                  if (entry.paxCount != null && entry.paxCount! > 0) ...[
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Icon(Icons.people_rounded, size: 13, color: cs.primary),
                        const SizedBox(width: 4),
                        Text(
                          '${entry.paxCount} Personen',
                          style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ),
          if (entry.cancellable == true)
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Icon(Icons.cancel_outlined, size: 18, color: cs.outline),
            ),
        ],
      ),
    );
  }

  IconData _itemTypeIcon(String? type) {
    switch (type) {
      case 'restaurant':
        return Icons.restaurant_rounded;
      case 'spa':
        return Icons.spa_rounded;
      case 'show':
        return Icons.theater_comedy_rounded;
      default:
        return Icons.event_rounded;
    }
  }
}

// ─── Itinerary Tab ────────────────────────────────────────────────────────────

class _ItineraryTab extends ConsumerWidget {
  const _ItineraryTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(itineraryProvider).when(
          loading: () => const LoadingView(),
          error: (e, _) => ErrorView(
            error: e,
            onRetry: () => ref.invalidate(itineraryProvider),
          ),
          data: (resp) {
            if (resp.ports.isEmpty) {
              return _EmptyState(
                icon: Icons.map_rounded,
                message: 'Keine Reiseroute verfügbar',
              );
            }
            return ListView.builder(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 100),
              itemCount: resp.ports.length,
              itemBuilder: (_, i) => _PortCard(
                port: resp.ports[i],
                isToday: _isToday(resp.ports[i]),
                isLast: i == resp.ports.length - 1,
              ),
            );
          },
        );
  }

  bool _isToday(ItineraryPort port) {
    final raw = port.dateLocalized?.datetimeRaw;
    if (raw == null || raw.length < 8) return false;
    final now = DateTime.now();
    final y = int.tryParse(raw.substring(0, 4));
    final m = int.tryParse(raw.substring(4, 6));
    final d = int.tryParse(raw.substring(6, 8));
    return y == now.year && m == now.month && d == now.day;
  }
}

class _PortCard extends StatelessWidget {
  final ItineraryPort port;
  final bool isToday;
  final bool isLast;

  const _PortCard({
    required this.port,
    required this.isToday,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Timeline column
          SizedBox(
            width: 36,
            child: Column(
              children: [
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isToday ? AppTheme.aidaRed : cs.surfaceContainerHighest,
                    border: Border.all(
                      color: isToday ? AppTheme.aidaRed : cs.outlineVariant,
                      width: 2,
                    ),
                  ),
                  child: Icon(
                    port.seaday ? Icons.waves_rounded : Icons.anchor_rounded,
                    size: 14,
                    color: isToday ? Colors.white : cs.onSurfaceVariant,
                  ),
                ),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      color: cs.outlineVariant.withValues(alpha: 0.4),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          // Card
          Expanded(
            child: Container(
              margin: EdgeInsets.only(bottom: isLast ? 0 : 8),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: isToday
                    ? AppTheme.aidaRed.withValues(alpha: 0.08)
                    : cs.surfaceContainerLow,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: isToday
                      ? AppTheme.aidaRed.withValues(alpha: 0.3)
                      : cs.outlineVariant.withValues(alpha: 0.5),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      // Day badge
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: isToday ? AppTheme.aidaRed : cs.surfaceContainerHighest,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          'Tag ${port.day ?? ''}',
                          style: tt.labelSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: isToday ? Colors.white : cs.onSurfaceVariant,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          port.name ?? (port.seaday ? 'Seetag' : ''),
                          style: tt.titleSmall?.copyWith(fontWeight: FontWeight.w700),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (isToday)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: AppTheme.aidaRed,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            'Heute',
                            style: tt.labelSmall?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                    ],
                  ),
                  if (!port.seaday) ...[
                    if (port.country != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        port.country!,
                        style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
                      ),
                    ],
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        if (port.arrivaltimeLocalized?.time != null)
                          _TimeChip(
                            icon: Icons.flight_land_rounded,
                            label: port.arrivaltimeLocalized!.time!,
                            color: cs.secondaryContainer,
                            textColor: cs.onSecondaryContainer,
                          ),
                        if (port.arrivaltimeLocalized?.time != null)
                          const SizedBox(width: 6),
                        if (port.departuretimeLocalized?.time != null)
                          _TimeChip(
                            icon: Icons.flight_takeoff_rounded,
                            label: port.departuretimeLocalized!.time!,
                            color: cs.secondaryContainer,
                            textColor: cs.onSecondaryContainer,
                          ),
                        if (port.onboardtimeLocalized?.time != null)
                          const SizedBox(width: 6),
                        if (port.onboardtimeLocalized?.time != null)
                          _TimeChip(
                            icon: Icons.directions_boat_rounded,
                            label: port.onboardtimeLocalized!.time!,
                            color: AppTheme.aidaRed.withValues(alpha: 0.12),
                            textColor: AppTheme.aidaRed,
                          ),
                      ],
                    ),
                    if (port.tender) ...[
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          Icon(Icons.directions_boat_rounded, size: 13, color: cs.primary),
                          const SizedBox(width: 4),
                          Text('Tender-Service', style: tt.bodySmall?.copyWith(color: cs.primary, fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ],
                  ] else ...[
                    const SizedBox(height: 4),
                    Text(
                      port.dateLocalized?.date ?? '',
                      style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TimeChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final Color textColor;

  const _TimeChip({
    required this.icon,
    required this.label,
    required this.color,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: textColor),
          const SizedBox(width: 4),
          Text(
            label,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: textColor,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ],
      ),
    );
  }
}

// ─── Excursions Tab ───────────────────────────────────────────────────────────

class _ExcursionsTab extends ConsumerWidget {
  const _ExcursionsTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(excursionsProvider).when(
          loading: () => const LoadingView(),
          error: (e, _) => ErrorView(
            error: e,
            onRetry: () => ref.invalidate(excursionsProvider),
          ),
          data: (resp) {
            if (resp.excursionList.isEmpty) {
              return _EmptyState(
                icon: Icons.explore_rounded,
                message: 'Keine Ausflüge verfügbar',
              );
            }
            return ListView.builder(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 100),
              itemCount: resp.excursionList.length,
              itemBuilder: (_, i) => _ExcursionCard(
                excursion: resp.excursionList[i],
              ),
            );
          },
        );
  }
}

class _ExcursionCard extends StatelessWidget {
  final Excursion excursion;

  const _ExcursionCard({required this.excursion});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: cs.surfaceContainerLow,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: cs.outlineVariant.withValues(alpha: 0.5)),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: () => _showDetail(context),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: cs.tertiaryContainer,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.sailing_rounded,
                        size: 20, color: cs.onTertiaryContainer),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      excursion.name ?? '',
                      style: tt.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (excursion.adultprice != null) ...[
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '${excursion.adultprice}',
                          style: tt.titleMedium?.copyWith(
                            color: cs.primary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          excursion.currency ?? '€',
                          style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  if (excursion.begdateLocalized?.datetime != null)
                    Row(
                      children: [
                        Icon(Icons.access_time_rounded, size: 13, color: cs.primary),
                        const SizedBox(width: 4),
                        Text(
                          excursion.begdateLocalized!.datetime!,
                          style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
                        ),
                      ],
                    ),
                  if (excursion.meetplace != null) ...[
                    const SizedBox(width: 12),
                    Icon(Icons.place_rounded, size: 13, color: cs.primary),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        excursion.meetplace!,
                        style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ],
              ),
              if (excursion.excBooked == true) ...[
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green.withValues(alpha: 0.12),
                    border: Border.all(color: Colors.green.withValues(alpha: 0.4)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.check_circle_rounded, size: 14, color: Colors.green),
                      const SizedBox(width: 4),
                      Text(
                        'Gebucht',
                        style: tt.labelSmall?.copyWith(
                          color: Colors.green,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  void _showDetail(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (_) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        maxChildSize: 0.95,
        minChildSize: 0.4,
        expand: false,
        builder: (_, ctrl) => ListView(
          controller: ctrl,
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
          children: [
            Text(
              excursion.name ?? '',
              style: tt.headlineSmall?.copyWith(fontWeight: FontWeight.w700),
            ),
            if (excursion.adultprice != null) ...[
              const SizedBox(height: 4),
              Text(
                '${excursion.adultprice} ${excursion.currency ?? '€'} pro Person',
                style: tt.titleMedium?.copyWith(
                  color: cs.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
            const SizedBox(height: 16),
            if (excursion.begdateLocalized?.datetime != null)
              _DetailRow(
                icon: Icons.access_time_rounded,
                text: excursion.begdateLocalized!.datetime!,
              ),
            if (excursion.meetplace != null)
              _DetailRow(
                icon: Icons.place_rounded,
                text: 'Treffpunkt: ${excursion.meetplace}${excursion.meetdateLocalized?.time != null ? ' um ${excursion.meetdateLocalized!.time}' : ''}',
              ),
            if (excursion.longdesc?.isNotEmpty == true) ...[
              const SizedBox(height: 12),
              const Divider(),
              const SizedBox(height: 12),
              Text(
                excursion.longdesc!,
                style: tt.bodyMedium?.copyWith(color: cs.onSurfaceVariant),
              ),
            ],
            if (excursion.excNotes?.isNotEmpty == true) ...[
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: cs.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  excursion.excNotes!,
                  style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const _DetailRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 16, color: cs.primary),
          const SizedBox(width: 8),
          Expanded(
            child: Text(text, style: Theme.of(context).textTheme.bodyMedium),
          ),
        ],
      ),
    );
  }
}

// ─── Shared ───────────────────────────────────────────────────────────────────

class _EmptyState extends StatelessWidget {
  final IconData icon;
  final String message;

  const _EmptyState({required this.icon, required this.message});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 56, color: cs.outline),
            const SizedBox(height: 12),
            Text(
              message,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: cs.onSurfaceVariant),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
