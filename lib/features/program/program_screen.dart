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
              expandedHeight: 100,
              pinned: true,
              stretch: true,
              backgroundColor: const Color(0xFF7C1200),
              foregroundColor: Colors.white,
              title: const Text(
                'Programm',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.3,
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  decoration: const BoxDecoration(gradient: AppTheme.gradSunrise),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 24),
                      child: Opacity(
                        opacity: 0.15,
                        child: const Icon(
                          Icons.theater_comedy_rounded,
                          size: 90,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              bottom: TabBar(
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white60,
                indicatorColor: Colors.white,
                indicatorWeight: 3,
                dividerColor: Colors.transparent,
                tabs: const [
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

// ─── Date strip ───────────────────────────────────────────────────────────────

class _DateStrip extends StatelessWidget {
  final DateTime selected;
  final void Function(DateTime) onChanged;

  const _DateStrip({required this.selected, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final today = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
    );
    // 3 days before + today + 6 days ahead = 10 total
    final dates = List.generate(10, (i) => today.add(Duration(days: i - 3)));
    final selectedDay = DateTime(selected.year, selected.month, selected.day);

    return Container(
      height: 78,
      color: cs.surfaceContainerLow,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        itemCount: dates.length,
        separatorBuilder: (_, __) => const SizedBox(width: 6),
        itemBuilder: (_, i) {
          final date = dates[i];
          final isSelected = date == selectedDay;
          final isToday = date == today;

          return GestureDetector(
            onTap: () => onChanged(date),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              width: 50,
              decoration: BoxDecoration(
                color: isSelected
                    ? AppTheme.aidaRed
                    : isToday
                        ? cs.surfaceContainerHighest
                        : cs.surface,
                borderRadius: BorderRadius.circular(14),
                border: isToday && !isSelected
                    ? Border.all(color: AppTheme.aidaRed, width: 1.5)
                    : Border.all(
                        color: cs.outlineVariant.withValues(alpha: 0.4)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    DateFormat('EEE', 'de').format(date).toUpperCase(),
                    style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w700,
                      color: isSelected
                          ? Colors.white70
                          : cs.onSurfaceVariant,
                      letterSpacing: 0.4,
                    ),
                  ),
                  const SizedBox(height: 1),
                  Text(
                    '${date.day}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: isSelected ? Colors.white : cs.onSurface,
                      letterSpacing: -0.5,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// ─── Events tab ───────────────────────────────────────────────────────────────

class _EventsTab extends ConsumerWidget {
  const _EventsTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = ref.watch(selectedDateProvider);
    final eventsAsync = ref.watch(dailyEventsProvider);

    return Column(
      children: [
        _DateStrip(
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

class _CategoryFilter extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(_selectedCategoryProvider);
    final eventsAsync = ref.watch(dailyEventsProvider);

    final categories = eventsAsync.maybeWhen(
      data: (resp) {
        final all = <String>{};
        final events = [
          ...resp.data?.morning ?? [],
          ...resp.data?.afternoon ?? [],
          ...resp.data?.evening ?? [],
          ...resp.data?.night ?? [],
        ];
        for (final e in events) {
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
      height: 46,
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

    final sections = <(String, IconData, Color, List<DailyEvent>)>[
      ('Morgen', Icons.wb_sunny_outlined, const Color(0xFFFFB300),
          filter(data.data?.morning ?? [])),
      ('Nachmittag', Icons.light_mode_outlined, const Color(0xFFFF6D00),
          filter(data.data?.afternoon ?? [])),
      ('Abend', Icons.nights_stay_outlined, const Color(0xFF5C6BC0),
          filter(data.data?.evening ?? [])),
      ('Nacht', Icons.bedtime_outlined, const Color(0xFF1A237E),
          filter(data.data?.night ?? [])),
    ].where((s) => s.$4.isNotEmpty).toList();

    if (sections.isEmpty) {
      return _Empty(
        icon: Icons.event_busy_rounded,
        message: 'Keine Veranstaltungen',
      );
    }

    return ListView(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 100),
      children: [
        for (final (label, icon, color, events) in sections) ...[
          _TimeHeader(label: label, icon: icon, color: color),
          ...events.map((e) => _EventCard(event: e, baseUrl: baseUrl)),
        ],
      ],
    );
  }
}

class _TimeHeader extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;

  const _TimeHeader({
    required this.label,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(top: 18, bottom: 8),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, size: 15, color: color),
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: color,
                  fontWeight: FontWeight.w700,
                ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Divider(
              color: cs.outlineVariant.withValues(alpha: 0.4),
            ),
          ),
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
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: cs.outlineVariant.withValues(alpha: 0.4)),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => _showDetail(context),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Time badge
              Container(
                width: 52,
                padding: const EdgeInsets.symmetric(vertical: 6),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppTheme.aidaRed.withValues(alpha: 0.15),
                      AppTheme.aidaRed.withValues(alpha: 0.05),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: AppTheme.aidaRed.withValues(alpha: 0.2),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      event.startDateTimeLocalized?.time ?? '--:--',
                      style: tt.labelSmall?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: AppTheme.aidaRed,
                        fontSize: 13,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    if (event.endDateTimeLocalized?.time != null) ...[
                      Icon(
                        Icons.arrow_downward_rounded,
                        size: 9,
                        color: AppTheme.aidaRed.withValues(alpha: 0.6),
                      ),
                      Text(
                        event.endDateTimeLocalized!.time!,
                        style: tt.labelSmall?.copyWith(
                          color: AppTheme.aidaRed.withValues(alpha: 0.7),
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
                    width: 68,
                    height: 68,
                    fit: BoxFit.cover,
                    errorWidget: (_, __, ___) => Container(
                      width: 68,
                      height: 68,
                      color: cs.surfaceContainerHighest,
                      child: Icon(Icons.image_rounded, color: cs.outline),
                    ),
                  ),
                ),
              if (event.image != null) const SizedBox(width: 10),
              // Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      event.title ?? event.eventName ?? '',
                      style: tt.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (event.venueName != null) ...[
                      const SizedBox(height: 3),
                      Row(
                        children: [
                          Icon(Icons.place_rounded, size: 11, color: cs.outline),
                          const SizedBox(width: 2),
                          Expanded(
                            child: Text(
                              event.venueName!,
                              style: tt.bodySmall?.copyWith(
                                color: cs.onSurfaceVariant,
                              ),
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 7, vertical: 2),
                          decoration: BoxDecoration(
                            color: cs.primaryContainer,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            c.label ?? '',
                            style: tt.labelSmall?.copyWith(
                              color: cs.onPrimaryContainer,
                              fontSize: 10,
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
                  child: Icon(
                    Icons.bookmark_add_rounded,
                    size: 18,
                    color: AppTheme.aidaBlue,
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
      builder: (_, ctrl) => ListView(
        controller: ctrl,
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
            Row(children: [
              Icon(Icons.place_rounded, size: 16, color: cs.primary),
              const SizedBox(width: 6),
              Text(event.venueName!, style: tt.bodyMedium),
            ]),
          if (event.startDateTimeLocalized != null) ...[
            const SizedBox(height: 4),
            Row(children: [
              Icon(Icons.access_time_rounded, size: 16, color: cs.primary),
              const SizedBox(width: 6),
              Text(
                '${event.startDateTimeLocalized!.time ?? ''}'
                '${event.endDateTimeLocalized?.time != null ? ' – ${event.endDateTimeLocalized!.time}' : ''}',
                style: tt.bodyMedium,
              ),
            ]),
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

// ─── Opening Hours tab ────────────────────────────────────────────────────────

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
        _DateStrip(
          selected: selectedDate,
          onChanged: (d) => ref.read(selectedDateProvider.notifier).state = d,
        ),
        Expanded(
          child: hoursAsync.when(
            loading: () => const LoadingView(),
            error: (e, _) => ErrorView(error: e),
            data: (resp) {
              if (resp.data.isEmpty) {
                return _Empty(
                  icon: Icons.access_time_rounded,
                  message: 'Keine Öffnungszeiten verfügbar',
                );
              }
              return ListView.builder(
                padding: const EdgeInsets.fromLTRB(12, 10, 12, 100),
                itemCount: resp.data.length,
                itemBuilder: (_, i) {
                  final cat = resp.data[i];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                      color: cs.surfaceContainerLow,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                          color: cs.outlineVariant.withValues(alpha: 0.4)),
                    ),
                    child: Theme(
                      data: Theme.of(context)
                          .copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        leading: Container(
                          padding: const EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            color: cs.primaryContainer,
                            borderRadius: BorderRadius.circular(9),
                          ),
                          child: Icon(Icons.restaurant_rounded,
                              size: 16, color: cs.onPrimaryContainer),
                        ),
                        title: Text(
                          cat.categoryName ?? '',
                          style: tt.bodyMedium
                              ?.copyWith(fontWeight: FontWeight.w700),
                        ),
                        subtitle: cat.description != null
                            ? Text(cat.description!, style: tt.bodySmall)
                            : null,
                        children: cat.venues.map((v) {
                          final periods = [
                            if (v.mealPeriods?.breakfast?.isNotEmpty == true)
                              'Frühstück: ${_fmtPeriods(v.mealPeriods!.breakfast!)}',
                            if (v.mealPeriods?.lunch?.isNotEmpty == true)
                              'Mittagessen: ${_fmtPeriods(v.mealPeriods!.lunch!)}',
                            if (v.mealPeriods?.dinner?.isNotEmpty == true)
                              'Abendessen: ${_fmtPeriods(v.mealPeriods!.dinner!)}',
                          ];
                          return ListTile(
                            dense: true,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 2),
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

  String _fmtPeriods(List<MealPeriod> periods) => periods
      .map((p) =>
          '${p.startDateLocalized?.time ?? ''} – ${p.endDateLocalized?.time ?? ''}')
      .join(', ');
}

// ─── Shared ───────────────────────────────────────────────────────────────────

class _Empty extends StatelessWidget {
  final IconData icon;
  final String message;
  const _Empty({required this.icon, required this.message});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 52, color: cs.outline),
          const SizedBox(height: 12),
          Text(
            message,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: cs.onSurfaceVariant),
          ),
        ],
      ),
    );
  }
}
