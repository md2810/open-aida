import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../core/providers/providers.dart';
import '../../core/models/timetable.dart';
import '../../core/models/itinerary.dart';
import '../../core/models/excursion.dart';
import '../../shared/widgets/error_view.dart';

class MyVacationScreen extends ConsumerWidget {
  const MyVacationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Mein Urlaub'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Termine'),
              Tab(text: 'Route'),
              Tab(text: 'Ausflüge'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            _TimetableTab(),
            _ItineraryTab(),
            _ExcursionsTab(),
          ],
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
              return const Center(child: Text('Keine Buchungen gefunden.'));
            }
            return ListView.builder(
              padding: const EdgeInsets.all(8),
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
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ListTile(
        leading: entry.image != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: CachedNetworkImage(
                  imageUrl: '$baseUrl${entry.image}',
                  width: 56,
                  height: 56,
                  fit: BoxFit.cover,
                  errorWidget: (_, __, ___) =>
                      const Icon(Icons.restaurant),
                ),
              )
            : CircleAvatar(
                backgroundColor:
                    Theme.of(context).colorScheme.primaryContainer,
                child: Icon(
                  _itemTypeIcon(entry.itemType),
                  color:
                      Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
        title: Text(
          entry.eventName ?? '',
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (entry.dateTimeLocalized != null)
              Text(entry.dateTimeLocalized!.datetime ?? ''),
            if (entry.location != null) Text(entry.location!),
            if (entry.paxCount != null && entry.paxCount! > 0)
              Text('${entry.paxCount} Personen'),
          ],
        ),
        isThreeLine: true,
        trailing: entry.cancellable == true
            ? const Icon(Icons.cancel_outlined, size: 18)
            : null,
      ),
    );
  }

  IconData _itemTypeIcon(String? type) {
    switch (type) {
      case 'restaurant':
        return Icons.restaurant;
      case 'spa':
        return Icons.spa;
      case 'show':
        return Icons.theater_comedy;
      default:
        return Icons.event;
    }
  }
}

// ─── Itinerary Tab ────────────────────────────────────────────────────────────

class _ItineraryTab extends ConsumerWidget {
  const _ItineraryTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shipName = ref.watch(shipNameProvider) ?? 'cosma';
    final baseUrl = 'https://bordportal.$shipName.aida.de';

    return ref.watch(itineraryProvider).when(
          loading: () => const LoadingView(),
          error: (e, _) => ErrorView(
            error: e,
            onRetry: () => ref.invalidate(itineraryProvider),
          ),
          data: (resp) {
            if (resp.ports.isEmpty) {
              return const Center(child: Text('Keine Reiseroute verfügbar.'));
            }
            return ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: resp.ports.length,
              itemBuilder: (_, i) => _PortCard(
                port: resp.ports[i],
                baseUrl: baseUrl,
                isToday: _isToday(resp.ports[i]),
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
  final String baseUrl;
  final bool isToday;

  const _PortCard({
    required this.port,
    required this.baseUrl,
    required this.isToday,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      color: isToday ? cs.primaryContainer.withValues(alpha: 0.3) : null,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Day badge
            Container(
              width: 48,
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: isToday ? cs.primary : cs.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Text(
                    'Tag',
                    style: TextStyle(
                      fontSize: 10,
                      color: isToday ? cs.onPrimary : cs.onSurfaceVariant,
                    ),
                  ),
                  Text(
                    port.day ?? '',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: isToday ? cs.onPrimary : cs.onSurface,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            // Port info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        port.seaday ? Icons.waves : Icons.anchor,
                        size: 16,
                        color: cs.primary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        port.name ?? '',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      if (isToday)
                        Container(
                          margin: const EdgeInsets.only(left: 8),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: cs.primary,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            'Heute',
                            style: TextStyle(
                              color: cs.onPrimary,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                    ],
                  ),
                  if (!port.seaday) ...[
                    Text(
                      port.country ?? '',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 4),
                    if (port.arrivaltimeLocalized?.time != null)
                      _TimeRow(
                        icon: Icons.login,
                        label: 'Ankunft',
                        time: port.arrivaltimeLocalized!.time!,
                      ),
                    if (port.departuretimeLocalized?.time != null)
                      _TimeRow(
                        icon: Icons.logout,
                        label: 'Abfahrt',
                        time: port.departuretimeLocalized!.time!,
                      ),
                    if (port.onboardtimeLocalized?.time != null)
                      _TimeRow(
                        icon: Icons.directions_boat,
                        label: 'An Bord',
                        time: port.onboardtimeLocalized!.time!,
                        emphasis: true,
                      ),
                  ] else ...[
                    Text(
                      port.dateLocalized?.date ?? '',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                  if (port.tender)
                    const Padding(
                      padding: EdgeInsets.only(top: 4),
                      child: Chip(
                        label: Text('Tender'),
                        avatar: Icon(Icons.directions_boat, size: 14),
                        padding: EdgeInsets.zero,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
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

class _TimeRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String time;
  final bool emphasis;

  const _TimeRow({
    required this.icon,
    required this.label,
    required this.time,
    this.emphasis = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 14, color: Theme.of(context).colorScheme.primary),
        const SizedBox(width: 4),
        Text(
          '$label: ',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        Text(
          time,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontWeight:
                    emphasis ? FontWeight.bold : FontWeight.normal,
                color: emphasis
                    ? Theme.of(context).colorScheme.error
                    : null,
              ),
        ),
      ],
    );
  }
}

// ─── Excursions Tab ───────────────────────────────────────────────────────────

class _ExcursionsTab extends ConsumerWidget {
  const _ExcursionsTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shipName = ref.watch(shipNameProvider) ?? 'cosma';
    final baseUrl = 'https://ext-api.$shipName.aida.de';

    return ref.watch(excursionsProvider).when(
          loading: () => const LoadingView(),
          error: (e, _) => ErrorView(
            error: e,
            onRetry: () => ref.invalidate(excursionsProvider),
          ),
          data: (resp) {
            if (resp.excursionList.isEmpty) {
              return const Center(
                  child: Text('Keine Ausflüge gefunden.'));
            }
            return ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: resp.excursionList.length,
              itemBuilder: (_, i) => _ExcursionCard(
                excursion: resp.excursionList[i],
                baseUrl: baseUrl,
              ),
            );
          },
        );
  }
}

class _ExcursionCard extends StatelessWidget {
  final Excursion excursion;
  final String baseUrl;

  const _ExcursionCard({required this.excursion, required this.baseUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => _showDetail(context),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      excursion.name ?? '',
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  if (excursion.adultprice != null)
                    Text(
                      '${excursion.adultprice} ${excursion.currency ?? '€'}',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 4),
              if (excursion.begdateLocalized?.datetime != null)
                Text(
                  excursion.begdateLocalized!.datetime!,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              if (excursion.meetplace != null)
                Text(
                  'Treffpunkt: ${excursion.meetplace}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              if (excursion.excBooked == true)
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.green.withValues(alpha: 0.1),
                    border: Border.all(color: Colors.green),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    'Gebucht',
                    style: TextStyle(color: Colors.green, fontSize: 12),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDetail(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        maxChildSize: 0.95,
        minChildSize: 0.5,
        expand: false,
        builder: (_, ctrl) => ListView(
          controller: ctrl,
          padding: const EdgeInsets.all(16),
          children: [
            Text(
              excursion.name ?? '',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            if (excursion.begdateLocalized?.datetime != null)
              ListTile(
                dense: true,
                leading: const Icon(Icons.access_time),
                title: Text(excursion.begdateLocalized!.datetime!),
              ),
            if (excursion.meetplace != null)
              ListTile(
                dense: true,
                leading: const Icon(Icons.location_on),
                title: Text(excursion.meetplace!),
                subtitle: excursion.meetdateLocalized?.time != null
                    ? Text('Treffpunkt: ${excursion.meetdateLocalized!.time}')
                    : null,
              ),
            if (excursion.longdesc?.isNotEmpty == true) ...[
              const SizedBox(height: 12),
              Text(excursion.longdesc!),
            ],
            if (excursion.excNotes?.isNotEmpty == true) ...[
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  excursion.excNotes!,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
