import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_html/flutter_html.dart';
import '../../core/providers/providers.dart';
import '../../core/models/restaurant.dart';
import '../../core/models/poi.dart';
import '../../core/models/spa.dart';
import '../../shared/theme/app_theme.dart';
import '../../shared/widgets/error_view.dart';

class DiscoverScreen extends ConsumerWidget {
  const DiscoverScreen({super.key});

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
                  'Entdecken',
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
                          Icons.explore_rounded,
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
                  Tab(icon: Icon(Icons.restaurant_rounded, size: 18), text: 'Restaurants'),
                  Tab(icon: Icon(Icons.place_rounded, size: 18), text: 'POIs'),
                  Tab(icon: Icon(Icons.spa_rounded, size: 18), text: 'Spa'),
                ],
              ),
            ),
          ],
          body: const TabBarView(
            children: [
              _RestaurantsTab(),
              _PoiTab(),
              _SpaTab(),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Restaurants Tab ──────────────────────────────────────────────────────────

class _RestaurantsTab extends ConsumerWidget {
  const _RestaurantsTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shipName = ref.watch(shipNameProvider) ?? 'cosma';
    final baseUrl = 'https://ext-api.$shipName.aida.de';

    return ref.watch(restaurantsProvider).when(
          loading: () => const LoadingView(),
          error: (e, _) => ErrorView(
            error: e,
            onRetry: () => ref.invalidate(restaurantsProvider),
          ),
          data: (resp) {
            final categories = <String, List<Restaurant>>{};
            for (final r in resp.data) {
              final cat = r.category ?? 'Sonstige';
              categories.putIfAbsent(cat, () => []).add(r);
            }

            final items = <Object>[];
            for (final entry in categories.entries) {
              items.add(entry.key); // section header
              items.addAll(entry.value);
            }

            if (items.isEmpty) {
              return _EmptyState(
                icon: Icons.restaurant_rounded,
                message: 'Keine Restaurants gefunden',
              );
            }

            return ListView.builder(
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 100),
              itemCount: items.length,
              itemBuilder: (_, i) {
                final item = items[i];
                if (item is String) {
                  return _SectionLabel(label: item);
                }
                return _RestaurantCard(
                  restaurant: item as Restaurant,
                  baseUrl: baseUrl,
                );
              },
            );
          },
        );
  }
}

class _RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;
  final String baseUrl;

  const _RestaurantCard({required this.restaurant, required this.baseUrl});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: cs.surfaceContainerLow,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: cs.outlineVariant.withValues(alpha: 0.5)),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => _showDetail(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (restaurant.image != null)
              CachedNetworkImage(
                imageUrl: '$baseUrl${restaurant.image}',
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
                errorWidget: (_, __, ___) => Container(
                  height: 80,
                  color: cs.surfaceContainerHighest,
                  child: Icon(Icons.restaurant_rounded, size: 40, color: cs.outline),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          restaurant.name ?? '',
                          style: tt.titleSmall?.copyWith(fontWeight: FontWeight.w700),
                        ),
                      ),
                      if (restaurant.deck != null) ...[
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: cs.surfaceContainerHighest,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            'Deck ${restaurant.deck}',
                            style: tt.labelSmall?.copyWith(color: cs.onSurfaceVariant),
                          ),
                        ),
                      ],
                    ],
                  ),
                  if (restaurant.teaser != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      restaurant.teaser!.replaceAll(RegExp(r'<[^>]*>'), ''),
                      style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                  if (restaurant.bookable == true || restaurant.chargeable == true) ...[
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        if (restaurant.bookable == true)
                          _StatusBadge(
                            label: 'Reservierbar',
                            icon: Icons.bookmark_add_rounded,
                            color: Colors.green,
                          ),
                        if (restaurant.chargeable == true) ...[
                          const SizedBox(width: 6),
                          _StatusBadge(
                            label: 'Kostenpflichtig',
                            icon: Icons.euro_rounded,
                            color: Colors.orange,
                          ),
                        ],
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDetail(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (_) => _RestaurantDetail(
        restaurant: restaurant,
        baseUrl: baseUrl,
      ),
    );
  }
}

class _RestaurantDetail extends StatelessWidget {
  final Restaurant restaurant;
  final String baseUrl;

  const _RestaurantDetail({required this.restaurant, required this.baseUrl});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return DraggableScrollableSheet(
      initialChildSize: 0.75,
      maxChildSize: 0.95,
      minChildSize: 0.4,
      expand: false,
      builder: (_, ctrl) => ListView(
        controller: ctrl,
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 32),
        children: [
          if (restaurant.image != null)
            CachedNetworkImage(
              imageUrl: '$baseUrl${restaurant.image}',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        restaurant.name ?? '',
                        style: tt.headlineSmall?.copyWith(fontWeight: FontWeight.w700),
                      ),
                    ),
                    if (restaurant.deck != null)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: cs.primaryContainer,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text('Deck ${restaurant.deck}',
                            style: tt.labelMedium?.copyWith(color: cs.onPrimaryContainer)),
                      ),
                  ],
                ),
                const SizedBox(height: 16),
                if (restaurant.description != null)
                  Html(data: restaurant.description!),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─── POI Tab ──────────────────────────────────────────────────────────────────

class _PoiTab extends ConsumerWidget {
  const _PoiTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shipName = ref.watch(shipNameProvider) ?? 'cosma';
    final baseUrl = 'https://ext-api.$shipName.aida.de';

    return ref.watch(poiListProvider).when(
          loading: () => const LoadingView(),
          error: (e, _) => ErrorView(
            error: e,
            onRetry: () => ref.invalidate(poiListProvider),
          ),
          data: (resp) {
            final categories = <String, List<Poi>>{};
            for (final p in resp.data) {
              final cat = p.category ?? 'Sonstige';
              categories.putIfAbsent(cat, () => []).add(p);
            }

            if (resp.data.isEmpty) {
              return _EmptyState(
                icon: Icons.place_rounded,
                message: 'Keine POIs gefunden',
              );
            }

            return ListView(
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 100),
              children: [
                for (final entry in categories.entries) ...[
                  _SectionLabel(label: entry.key),
                  ...entry.value.map((poi) => _PoiCard(poi: poi, baseUrl: baseUrl)),
                ],
              ],
            );
          },
        );
  }
}

class _PoiCard extends StatelessWidget {
  final Poi poi;
  final String baseUrl;

  const _PoiCard({required this.poi, required this.baseUrl});

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
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: poi.imageUrl != null
                    ? CachedNetworkImage(
                        imageUrl: '$baseUrl${poi.imageUrl}',
                        width: 64,
                        height: 64,
                        fit: BoxFit.cover,
                        errorWidget: (_, __, ___) => _PlaceholderIcon(
                          icon: Icons.place_rounded,
                          cs: cs,
                        ),
                      )
                    : _PlaceholderIcon(icon: Icons.place_rounded, cs: cs),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      poi.name ?? '',
                      style: tt.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (poi.deck != null) ...[
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          Icon(Icons.layers_rounded, size: 13, color: cs.primary),
                          const SizedBox(width: 4),
                          Text(
                            'Deck ${poi.deck}',
                            style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
              Icon(Icons.chevron_right_rounded, color: cs.outline),
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
      builder: (_) => _PoiDetail(poi: poi, baseUrl: baseUrl),
    );
  }
}

class _PoiDetail extends StatelessWidget {
  final Poi poi;
  final String baseUrl;

  const _PoiDetail({required this.poi, required this.baseUrl});

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;

    return DraggableScrollableSheet(
      initialChildSize: 0.75,
      maxChildSize: 0.95,
      minChildSize: 0.4,
      expand: false,
      builder: (_, ctrl) => ListView(
        controller: ctrl,
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 32),
        children: [
          if (poi.imageUrl != null)
            CachedNetworkImage(
              imageUrl: '$baseUrl${poi.imageUrl}',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        poi.name ?? '',
                        style: tt.headlineSmall?.copyWith(fontWeight: FontWeight.w700),
                      ),
                    ),
                    if (poi.deck != null)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: cs.primaryContainer,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text('Deck ${poi.deck}',
                            style: tt.labelMedium?.copyWith(color: cs.onPrimaryContainer)),
                      ),
                  ],
                ),
                const SizedBox(height: 16),
                if (poi.teaser != null)
                  Html(data: poi.teaser!, style: {'p': Style(fontWeight: FontWeight.bold)}),
                if (poi.description != null)
                  Html(data: poi.description!),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Spa Tab ─────────────────────────────────────────────────────────────────

class _SpaTab extends ConsumerWidget {
  const _SpaTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shipName = ref.watch(shipNameProvider) ?? 'cosma';
    final baseUrl = 'https://ext-api.$shipName.aida.de';

    return ref.watch(spaItemsProvider).when(
          loading: () => const LoadingView(),
          error: (e, _) => ErrorView(
            error: e,
            onRetry: () => ref.invalidate(spaItemsProvider),
          ),
          data: (resp) {
            final categories = <String, List<SpaItem>>{};
            for (final s in resp.data) {
              final cat = s.category ?? 'Sonstige';
              categories.putIfAbsent(cat, () => []).add(s);
            }

            if (resp.data.isEmpty) {
              return _EmptyState(
                icon: Icons.spa_rounded,
                message: 'Kein Spa-Angebot gefunden',
              );
            }

            return ListView(
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 100),
              children: [
                for (final entry in categories.entries) ...[
                  _SectionLabel(label: entry.key),
                  ...entry.value.map((item) => _SpaCard(item: item, baseUrl: baseUrl)),
                ],
              ],
            );
          },
        );
  }
}

class _SpaCard extends StatelessWidget {
  final SpaItem item;
  final String baseUrl;

  const _SpaCard({required this.item, required this.baseUrl});

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
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: item.image != null
                    ? CachedNetworkImage(
                        imageUrl: '$baseUrl${item.image}',
                        width: 64,
                        height: 64,
                        fit: BoxFit.cover,
                        errorWidget: (_, __, ___) =>
                            _PlaceholderIcon(icon: Icons.spa_rounded, cs: cs),
                      )
                    : _PlaceholderIcon(icon: Icons.spa_rounded, cs: cs),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name ?? '',
                      style: tt.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (item.locationName != null) ...[
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          Icon(Icons.place_rounded, size: 13, color: cs.primary),
                          const SizedBox(width: 4),
                          Text(
                            item.locationName!,
                            style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
                          ),
                        ],
                      ),
                    ],
                    if (item.bookable == true) ...[
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.bookmark_add_rounded, size: 13, color: cs.tertiary),
                          const SizedBox(width: 4),
                          Text(
                            'Buchbar',
                            style: tt.labelSmall?.copyWith(
                              color: cs.tertiary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
              Icon(Icons.chevron_right_rounded, color: cs.outline),
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
      builder: (_) => DraggableScrollableSheet(
        initialChildSize: 0.75,
        maxChildSize: 0.95,
        minChildSize: 0.4,
        expand: false,
        builder: (_, ctrl) => ListView(
          controller: ctrl,
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 32),
          children: [
            if (item.image != null)
              CachedNetworkImage(
                imageUrl: 'https://ext-api.cosma.aida.de${item.image}',
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(fontWeight: FontWeight.w700),
                  ),
                  if (item.locationName != null) ...[
                    const SizedBox(height: 4),
                    Text(item.locationName!,
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                  const SizedBox(height: 16),
                  if (item.teaser != null) Html(data: item.teaser!),
                  if (item.description != null) Html(data: item.description!),
                  if (item.additionalInformation?.isNotEmpty == true) ...[
                    const SizedBox(height: 12),
                    Text(
                      'Zusatzinformationen',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const SizedBox(height: 4),
                    Text(item.additionalInformation!),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Shared widgets ───────────────────────────────────────────────────────────

class _SectionLabel extends StatelessWidget {
  final String label;
  const _SectionLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 8),
      child: Row(
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: cs.primary,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.4,
                ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Divider(color: cs.outlineVariant.withValues(alpha: 0.5)),
          ),
        ],
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;

  const _StatusBadge({
    required this.label,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        border: Border.all(color: color.withValues(alpha: 0.4)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: color),
          const SizedBox(width: 4),
          Text(
            label,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: color,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ],
      ),
    );
  }
}

class _PlaceholderIcon extends StatelessWidget {
  final IconData icon;
  final ColorScheme cs;

  const _PlaceholderIcon({required this.icon, required this.cs});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      height: 64,
      color: cs.surfaceContainerHighest,
      child: Icon(icon, color: cs.outline, size: 28),
    );
  }
}

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
