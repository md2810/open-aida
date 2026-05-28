import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';
import '../../core/providers/providers.dart';
import '../../core/models/event.dart';
import '../../shared/theme/app_theme.dart';
import '../../shared/widgets/error_view.dart';

final _selectedCategoryProvider = StateProvider<String?>((ref) => null);

class ProgramScreen extends ConsumerWidget {
  const ProgramScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 2,
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
                  'Programm',
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
                          Icons.event_rounded,
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
                  Tab(text: 'Veranstaltungen'),
                  Tab(text: 'Öffnungszeiten'),
                ],
              ),
            ),
          ],
          body: const TabBarView(
            children: [
              _EventsTab(),
              _OpeningHoursTab(),
            ],
          ),
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
        _DatePickerRow(
          selected: selectedDate,
          onChanged: (d) => ref.read(selectedDateProvider.notifier).state = d,
        ),
        _CategoryFilter(),
        Expanded(
          child: eventsAsync.when(
            loading: () => const LoadingView(),
            error: (e, _) => ErrorView(
              error: e,
              onRetry: () => ref.invalidate(dailyEventsProvider),
            ),
            data: (resp) => _EventList(data: resp),
          ),
        ),
      ],
    );
  }
}

class _DatePickerRow extends StatelessWidget {
  final DateTime selected;
  final void Function(DateTime) onChanged;

  const _DatePickerRow({required this.selected, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final fmt = DateFormat('EEE, dd. MMM', 'de');
    final today = DateTime.now();

    return Container(
      color: cs.surfaceContainerLow,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.chevron_left_rounded),
            onPressed: () => onChanged(selected.subtract(const Duration(days: 1))),
            style: IconButton.styleFrom(foregroundColor: cs.primary),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () async {
                final picked = await showDatePicker(
                  context: context,
                  initialDate: selected,
                  firstDate: today.subtract(const Duration(days: 1)),
                  lastDate: today.add(const Duration(days: 14)),
                );
                if (picked != null) onChanged(picked);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                decoration: BoxDecoration(
                  color: cs.surface,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: cs.outlineVariant.withValues(alpha: 0.5)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.calendar_today_rounded, size: 16, color: cs.primary),
                    const SizedBox(width: 8),
                    Text(
                      _isToday(selected, today)
                          ? 'Heute, ${fmt.format(selected)}'
                          : fmt.format(selected),
                      style: tt.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: cs.onSurface,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.chevron_right_rounded),
            onPressed: () => onChanged(selected.add(const Duration(days: 1))),
            style: IconButton.styleFrom(foregroundColor: cs.primary),
          ),
        ],
      ),
    );
  }

  bool _isToday(DateTime d, DateTime today) =>
      d.year == today.year && d.month == today.month && d.day == today.day;
}

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

    return Container(
      height: 48,
      color: Theme.of(context).colorScheme.surface,
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

  const _EventList({required this.data});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCat = ref.watch(_selectedCategoryProvider);
    final shipName = ref.watch(shipNameProvider) ?? 'cosma';
    final baseUrl = 'https://bordportal.$shipName.aida.de';

    List<DailyEvent> filter(List<DailyEvent> list) {
      if (selectedCat == null) return list;
      return list
          .where((e) => e.categories.any((c) => c.label == selectedCat))
          .toList();
    }

    final sections = <(String, IconData, List<DailyEvent>)>[
      ('Morgen', Icons.wb_sunny_outlined, filter(data.data?.morning ?? [])),
      ('Nachmittag', Icons.light_mode_outlined, filter(data.data?.afternoon ?? [])),
      ('Abend', Icons.nights_stay_outlined, filter(data.data?.evening ?? [])),
      ('Nacht', Icons.bedtime_outlined, filter(data.data?.night ?? [])),
    ].where((s) => s.$3.isNotEmpty).toList();

    if (sections.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.event_busy_rounded,
                  size: 56,
                  color: Theme.of(context).colorScheme.outline),
              const SizedBox(height: 12),
              Text(
                'Keine Veranstaltungen',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
            ],
          ),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 100),
      itemCount: sections.fold<int>(0, (sum, s) => sum + s.$3.length + 1),
      itemBuilder: (_, idx) {
        int offset = 0;
        for (final (label, icon, events) in sections) {
          if (idx == offset) {
            return _SectionHeader(label: label, icon: icon);
          }
          offset++;
          if (idx < offset + events.length) {
            return _EventCard(
              event: events[idx - offset],
              baseUrl: baseUrl,
            );
          }
          offset += events.length;
        }
        return null;
      },
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String label;
  final IconData icon;

  const _SectionHeader({required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 8),
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
          Text(
            label,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: cs.primary,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.4,
                ),
          ),
          const SizedBox(width: 8),
          Expanded(child: Divider(color: cs.outlineVariant.withValues(alpha: 0.5))),
        ],
      ),
    );
  }
}

class _EventCard extends StatelessWidget {
  final DailyEvent event;
  final String baseUrl;

  const _EventCard({required this.event, required this.baseUrl});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: cs.surfaceContainerLow,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: cs.outlineVariant.withValues(alpha: 0.5)),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: () => _showDetail(context),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Time badge
              Container(
                width: 50,
                padding: const EdgeInsets.symmetric(vertical: 6),
                decoration: BoxDecoration(
                  color: cs.primaryContainer,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      event.startDateTimeLocalized?.time ?? '--:--',
                      style: tt.labelSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: cs.onPrimaryContainer,
                        fontSize: 13,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    if (event.endDateTimeLocalized?.time != null) ...[
                      Icon(Icons.arrow_downward_rounded, size: 10, color: cs.onPrimaryContainer.withValues(alpha: 0.6)),
                      Text(
                        event.endDateTimeLocalized!.time!,
                        style: tt.labelSmall?.copyWith(
                          color: cs.onPrimaryContainer.withValues(alpha: 0.7),
                          fontSize: 10,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(width: 12),
              // Thumbnail
              if (event.image != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: '$baseUrl${event.image}',
                    width: 72,
                    height: 72,
                    fit: BoxFit.cover,
                    errorWidget: (_, __, ___) => SizedBox(
                      width: 72,
                      height: 72,
                      child: Icon(Icons.image_rounded, color: cs.outline),
                    ),
                  ),
                ),
              if (event.image != null) const SizedBox(width: 12),
              // Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      event.title ?? event.eventName ?? '',
                      style: tt.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (event.venueName != null) ...[
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          Icon(Icons.place_rounded, size: 12, color: cs.outline),
                          const SizedBox(width: 2),
                          Expanded(
                            child: Text(
                              event.venueName!,
                              style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                    if (event.categories.isNotEmpty) ...[
                      const SizedBox(height: 6),
                      Wrap(
                        spacing: 4,
                        runSpacing: 4,
                        children: event.categories.take(2).map((c) => Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: cs.secondaryContainer,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            c.label ?? '',
                            style: tt.labelSmall?.copyWith(
                              color: cs.onSecondaryContainer,
                            ),
                          ),
                        )).toList(),
                      ),
                    ],
                  ],
                ),
              ),
              if (event.bookable == true)
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Icon(Icons.bookmark_add_rounded, size: 20, color: cs.primary),
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
      showDragHandle: true,
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
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      maxChildSize: 0.95,
      minChildSize: 0.4,
      expand: false,
      builder: (_, controller) => ListView(
        controller: controller,
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        children: [
          if (event.image != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CachedNetworkImage(
                imageUrl: '$baseUrl${event.image}',
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          const SizedBox(height: 16),
          Text(
            event.title ?? event.eventName ?? '',
            style: tt.headlineSmall?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 8),
          if (event.venueName != null)
            Row(
              children: [
                Icon(Icons.place_rounded, size: 16, color: cs.primary),
                const SizedBox(width: 6),
                Text(event.venueName!, style: tt.bodyMedium),
              ],
            ),
          if (event.startDateTimeLocalized != null) ...[
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.access_time_rounded, size: 16, color: cs.primary),
                const SizedBox(width: 6),
                Text(
                  '${event.startDateTimeLocalized!.time ?? ''}'
                  '${event.endDateTimeLocalized?.time != null ? ' – ${event.endDateTimeLocalized!.time}' : ''}',
                  style: tt.bodyMedium,
                ),
              ],
            ),
          ],
          if (event.description?.isNotEmpty == true) ...[
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 12),
            Text(
              event.description!.replaceAll(RegExp(r'<[^>]*>'), ''),
              style: tt.bodyMedium?.copyWith(color: cs.onSurfaceVariant),
            ),
          ],
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
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return Column(
      children: [
        _DatePickerRow(
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
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.access_time_rounded,
                            size: 56, color: cs.outline),
                        const SizedBox(height: 12),
                        Text(
                          'Keine Öffnungszeiten verfügbar',
                          style: tt.titleMedium?.copyWith(
                              color: cs.onSurfaceVariant),
                        ),
                      ],
                    ),
                  ),
                );
              }
              return ListView.builder(
                padding: const EdgeInsets.fromLTRB(12, 8, 12, 100),
                itemCount: resp.data.length,
                itemBuilder: (_, i) {
                  final cat = resp.data[i];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                      color: cs.surfaceContainerLow,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                          color: cs.outlineVariant.withValues(alpha: 0.5)),
                    ),
                    child: Theme(
                      data: Theme.of(context).copyWith(
                        dividerColor: Colors.transparent,
                      ),
                      child: ExpansionTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        leading: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: cs.primaryContainer,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(Icons.restaurant_rounded,
                              size: 16, color: cs.onPrimaryContainer),
                        ),
                        title: Text(
                          cat.categoryName ?? '',
                          style: tt.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        subtitle: cat.description != null
                            ? Text(cat.description!, style: tt.bodySmall)
                            : null,
                        children: cat.venues.map((v) {
                          final periods = [
                            if (v.mealPeriods?.breakfast?.isNotEmpty == true)
                              'Frühstück: ${_formatPeriods(v.mealPeriods!.breakfast!)}',
                            if (v.mealPeriods?.lunch?.isNotEmpty == true)
                              'Mittagessen: ${_formatPeriods(v.mealPeriods!.lunch!)}',
                            if (v.mealPeriods?.dinner?.isNotEmpty == true)
                              'Abendessen: ${_formatPeriods(v.mealPeriods!.dinner!)}',
                          ];
                          return ListTile(
                            dense: true,
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                            title: Text(v.venueName ?? '',
                                style: tt.bodySmall?.copyWith(
                                    fontWeight: FontWeight.w600)),
                            subtitle: periods.isNotEmpty
                                ? Text(periods.join('\n'),
                                    style: tt.bodySmall?.copyWith(
                                        color: cs.onSurfaceVariant))
                                : null,
                            isThreeLine: periods.length > 1,
                          );
                        }).toList(),
                      ),
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
