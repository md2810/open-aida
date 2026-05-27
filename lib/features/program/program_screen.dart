import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';
import '../../core/providers/providers.dart';
import '../../core/models/event.dart';
import '../../shared/widgets/error_view.dart';

class ProgramScreen extends ConsumerWidget {
  const ProgramScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Programm'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Veranstaltungen'),
              Tab(text: 'Öffnungszeiten'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            _EventsTab(),
            _OpeningHoursTab(),
          ],
        ),
      ),
    );
  }
}

// ─── Events Tab ──────────────────────────────────────────────────────────────

class _EventsTab extends ConsumerWidget {
  const _EventsTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = ref.watch(selectedDateProvider);
    final eventsAsync = ref.watch(dailyEventsProvider);

    return Column(
      children: [
        _DatePicker(
          selected: selectedDate,
          onChanged: (d) =>
              ref.read(selectedDateProvider.notifier).state = d,
        ),
        _CategoryFilter(),
        Expanded(
          child: eventsAsync.when(
            loading: () => const LoadingView(),
            error: (e, _) => ErrorView(
              error: e,
              onRetry: () => ref.invalidate(dailyEventsProvider),
            ),
            data: (resp) => _EventList(data: resp, ref: ref),
          ),
        ),
      ],
    );
  }
}

final _selectedCategoryProvider = StateProvider<String?>((ref) => null);

class _CategoryFilter extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(_selectedCategoryProvider);
    final eventsAsync = ref.watch(dailyEventsProvider);

    final categories = eventsAsync.maybeWhen(
      data: (resp) {
        final all = <String>{};
        for (final e in _allEvents(resp)) {
          for (final c in e.categories) {
            if (c.label != null) all.add(c.label!);
          }
        }
        return all.toList()..sort();
      },
      orElse: () => <String>[],
    );

    if (categories.isEmpty) return const SizedBox.shrink();

    return SizedBox(
      height: 44,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        children: [
          FilterChip(
            label: const Text('Alle'),
            selected: selected == null,
            onSelected: (_) =>
                ref.read(_selectedCategoryProvider.notifier).state = null,
          ),
          const SizedBox(width: 6),
          ...categories.map((c) => Padding(
                padding: const EdgeInsets.only(right: 6),
                child: FilterChip(
                  label: Text(c),
                  selected: selected == c,
                  onSelected: (v) =>
                      ref.read(_selectedCategoryProvider.notifier).state =
                          v ? c : null,
                ),
              )),
        ],
      ),
    );
  }

  List<DailyEvent> _allEvents(DailyEventsResponse resp) {
    if (resp.data == null) return [];
    return [
      ...resp.data!.morning,
      ...resp.data!.afternoon,
      ...resp.data!.evening,
      ...resp.data!.night,
    ];
  }
}

class _EventList extends ConsumerWidget {
  final DailyEventsResponse data;
  final WidgetRef ref;

  const _EventList({required this.data, required this.ref});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCat = ref.watch(_selectedCategoryProvider);
    final shipName = ref.watch(shipNameProvider) ?? 'cosma';

    List<DailyEvent> filter(List<DailyEvent> list) {
      if (selectedCat == null) return list;
      return list
          .where((e) => e.categories.any((c) => c.label == selectedCat))
          .toList();
    }

    final sections = <(String, List<DailyEvent>)>[
      ('Morgen', filter(data.data?.morning ?? [])),
      ('Nachmittag', filter(data.data?.afternoon ?? [])),
      ('Abend', filter(data.data?.evening ?? [])),
      ('Nacht', filter(data.data?.night ?? [])),
    ].where((s) => s.$2.isNotEmpty).toList();

    if (sections.isEmpty) {
      return const Center(child: Text('Keine Veranstaltungen gefunden.'));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: sections.fold<int>(0, (sum, s) => sum + s.$2.length + 1),
      itemBuilder: (_, idx) {
        int offset = 0;
        for (final (label, events) in sections) {
          if (idx == offset) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(8, 12, 8, 4),
              child: Text(
                label,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            );
          }
          offset++;
          if (idx < offset + events.length) {
            return _EventCard(
              event: events[idx - offset],
              baseUrl: 'https://bordportal.$shipName.aida.de',
            );
          }
          offset += events.length;
        }
        return null;
      },
    );
  }
}

class _EventCard extends StatelessWidget {
  final DailyEvent event;
  final String baseUrl;

  const _EventCard({required this.event, required this.baseUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => _showDetail(context),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Time
              SizedBox(
                width: 48,
                child: Text(
                  event.startDateTimeLocalized?.time ?? '',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              ),
              // Image
              if (event.image != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: '$baseUrl${event.image}',
                    width: 64,
                    height: 64,
                    fit: BoxFit.cover,
                    errorWidget: (_, __, ___) =>
                        const Icon(Icons.image_not_supported),
                  ),
                ),
              const SizedBox(width: 12),
              // Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      event.title ?? event.eventName ?? '',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    if (event.venueName != null)
                      Text(
                        event.venueName!,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    const SizedBox(height: 4),
                    Wrap(
                      spacing: 4,
                      children: event.categories.map((c) => Chip(
                            label: Text(c.label ?? ''),
                            padding: EdgeInsets.zero,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            labelStyle:
                                Theme.of(context).textTheme.bodySmall,
                          )).toList(),
                    ),
                  ],
                ),
              ),
              if (event.bookable == true)
                Icon(Icons.bookmark_border,
                    color: Theme.of(context).colorScheme.primary),
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
      builder: (_) => _EventDetail(event: event, baseUrl: baseUrl),
    );
  }
}

class _EventDetail extends StatelessWidget {
  final DailyEvent event;
  final String baseUrl;

  const _EventDetail({required this.event, required this.baseUrl});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      maxChildSize: 0.95,
      minChildSize: 0.5,
      expand: false,
      builder: (_, controller) => ListView(
        controller: controller,
        padding: const EdgeInsets.all(16),
        children: [
          if (event.image != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                imageUrl: '$baseUrl${event.image}',
                height: 180,
                fit: BoxFit.cover,
              ),
            ),
          const SizedBox(height: 12),
          Text(
            event.title ?? event.eventName ?? '',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          if (event.venueName != null)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(event.venueName!,
                  style: Theme.of(context).textTheme.bodyMedium),
            ),
          if (event.startDateTimeLocalized != null)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                '${event.startDateTimeLocalized!.datetime ?? ''}'
                '${event.endDateTimeLocalized?.time != null ? ' – ${event.endDateTimeLocalized!.time}' : ''}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          const SizedBox(height: 12),
          if (event.description?.isNotEmpty == true)
            Text(
              event.description!.replaceAll(RegExp(r'<[^>]*>'), ''),
            ),
        ],
      ),
    );
  }
}

// ─── Date Picker ─────────────────────────────────────────────────────────────

class _DatePicker extends StatelessWidget {
  final DateTime selected;
  final void Function(DateTime) onChanged;

  const _DatePicker({required this.selected, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final fmt = DateFormat('dd. MMMM', 'de');
    final today = DateTime.now();

    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () => onChanged(
              selected.subtract(const Duration(days: 1)),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () async {
                final picked = await showDatePicker(
                  context: context,
                  initialDate: selected,
                  firstDate: today.subtract(const Duration(days: 1)),
                  lastDate: today.add(const Duration(days: 10)),
                );
                if (picked != null) onChanged(picked);
              },
              child: Text(
                selected.day == today.day &&
                        selected.month == today.month &&
                        selected.year == today.year
                    ? 'Heute, ${fmt.format(selected)}'
                    : fmt.format(selected),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.chevron_right),
            onPressed: () => onChanged(
              selected.add(const Duration(days: 1)),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Opening Hours Tab ────────────────────────────────────────────────────────

class _OpeningHoursTab extends ConsumerWidget {
  const _OpeningHoursTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = ref.watch(selectedDateProvider);
    final hoursAsync = ref.watch(openingHoursProvider);

    return Column(
      children: [
        _DatePicker(
          selected: selectedDate,
          onChanged: (d) =>
              ref.read(selectedDateProvider.notifier).state = d,
        ),
        Expanded(
          child: hoursAsync.when(
            loading: () => const LoadingView(),
            error: (e, _) => ErrorView(error: e),
            data: (resp) {
              if (resp.data.isEmpty) {
                return const Center(
                    child: Text('Keine Öffnungszeiten verfügbar.'));
              }
              return ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: resp.data.length,
                itemBuilder: (_, i) {
                  final cat = resp.data[i];
                  return Card(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 4),
                    child: ExpansionTile(
                      title: Text(cat.categoryName ?? ''),
                      subtitle:
                          cat.description != null ? Text(cat.description!) : null,
                      children: cat.venues.map((v) {
                        final dinner = v.mealPeriods?.dinner ?? [];
                        final breakfast = v.mealPeriods?.breakfast ?? [];
                        final lunch = v.mealPeriods?.lunch ?? [];
                        return ListTile(
                          title: Text(v.venueName ?? ''),
                          subtitle: Text(
                            [
                              if (breakfast.isNotEmpty)
                                'Frühstück: ${_formatPeriods(breakfast)}',
                              if (lunch.isNotEmpty)
                                'Mittagessen: ${_formatPeriods(lunch)}',
                              if (dinner.isNotEmpty)
                                'Abendessen: ${_formatPeriods(dinner)}',
                            ].join('\n'),
                          ),
                          isThreeLine: true,
                          dense: true,
                        );
                      }).toList(),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  String _formatPeriods(List<MealPeriod> periods) {
    return periods
        .map((p) =>
            '${p.startDateLocalized?.time ?? ''} – ${p.endDateLocalized?.time ?? ''}')
        .join(', ');
  }
}
