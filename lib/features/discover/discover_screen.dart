import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_html/flutter_html.dart';
import '../../core/providers/providers.dart';
import '../../core/models/restaurant.dart';
import '../../core/models/poi.dart';
import '../../core/models/spa.dart';
import '../../shared/widgets/error_view.dart';

class DiscoverScreen extends ConsumerWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Entdecken'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.restaurant), text: 'Restaurants'),
              Tab(icon: Icon(Icons.location_on), text: 'POIs'),
              Tab(icon: Icon(Icons.spa), text: 'Spa'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            _RestaurantsTab(),
            _PoiTab(),
            _SpaTab(),
          ],
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
            // Group by category
            final categories = <String, List<Restaurant>>{};
            for (final r in resp.data) {
              final cat = r.category ?? 'Sonstige';
              categories.putIfAbsent(cat, () => []).add(r);
            }

            return ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: categories.keys.length * 2 -
                  (categories.isEmpty ? 0 : 1) +
                  categories.values.fold(0, (s, l) => s + l.length),
              itemBuilder: (_, idx) {
                int offset = 0;
                for (final entry in categories.entries) {
                  if (idx == offset) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(8, 12, 8, 4),
                      child: Text(
                        entry.key,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    );
                  }
                  offset++;
                  if (idx < offset + entry.value.length) {
                    return _RestaurantCard(
                      restaurant: entry.value[idx - offset],
                      baseUrl: baseUrl,
                    );
                  }
                  offset += entry.value.length;
                }
                return null;
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
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => _showDetail(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (restaurant.image != null)
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12)),
                child: CachedNetworkImage(
                  imageUrl: '$baseUrl${restaurant.image}',
                  height: 140,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorWidget: (_, __, ___) => Container(
                    height: 80,
                    color: Theme.of(context).colorScheme.surfaceContainerHighest,
                    child: const Icon(Icons.restaurant, size: 40),
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          restaurant.name ?? '',
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                      if (restaurant.deck != null)
                        Text(
                          'Deck ${restaurant.deck}',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                    ],
                  ),
                  if (restaurant.teaser != null)
                    Text(
                      restaurant.teaser!
                          .replaceAll(RegExp(r'<[^>]*>'), ''),
                      style: Theme.of(context).textTheme.bodySmall,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      if (restaurant.bookable == true)
                        const _Tag(label: 'Buchbar', color: Colors.green),
                      if (restaurant.chargeable == true)
                        const _Tag(label: 'Kostenpflichtig', color: Colors.orange),
                    ],
                  ),
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
      builder: (_) => _RestaurantDetail(
          restaurant: restaurant, baseUrl: baseUrl),
    );
  }
}

class _RestaurantDetail extends StatelessWidget {
  final Restaurant restaurant;
  final String baseUrl;

  const _RestaurantDetail({required this.restaurant, required this.baseUrl});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.75,
      maxChildSize: 0.95,
      minChildSize: 0.5,
      expand: false,
      builder: (_, ctrl) => ListView(
        controller: ctrl,
        children: [
          if (restaurant.image != null)
            CachedNetworkImage(
              imageUrl: '$baseUrl${restaurant.image}',
              height: 200,
              fit: BoxFit.cover,
            ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  restaurant.name ?? '',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                if (restaurant.deck != null)
                  Text('Deck ${restaurant.deck}'),
                const SizedBox(height: 12),
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

class _Tag extends StatelessWidget {
  final String label;
  final Color color;

  const _Tag({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 4),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(label,
          style: TextStyle(fontSize: 11, color: color)),
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
            // Group by category
            final categories = <String, List<Poi>>{};
            for (final p in resp.data) {
              final cat = p.category ?? 'Sonstige';
              categories.putIfAbsent(cat, () => []).add(p);
            }

            return ListView(
              padding: const EdgeInsets.all(8),
              children: [
                for (final entry in categories.entries) ...[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 12, 8, 4),
                    child: Text(
                      entry.key,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  ...entry.value.map((poi) => _PoiCard(
                        poi: poi,
                        baseUrl: baseUrl,
                      )),
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
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => _showDetail(context),
        child: ListTile(
          leading: poi.imageUrl != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: '$baseUrl${poi.imageUrl}',
                    width: 56,
                    height: 56,
                    fit: BoxFit.cover,
                    errorWidget: (_, __, ___) =>
                        const Icon(Icons.location_on),
                  ),
                )
              : const Icon(Icons.location_on),
          title: Text(poi.name ?? ''),
          subtitle: Text('Deck ${poi.deck ?? '-'}'),
          trailing: const Icon(Icons.chevron_right),
        ),
      ),
    );
  }

  void _showDetail(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
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
    return DraggableScrollableSheet(
      initialChildSize: 0.75,
      maxChildSize: 0.95,
      minChildSize: 0.5,
      expand: false,
      builder: (_, ctrl) => ListView(
        controller: ctrl,
        children: [
          if (poi.imageUrl != null)
            CachedNetworkImage(
              imageUrl: '$baseUrl${poi.imageUrl}',
              height: 200,
              fit: BoxFit.cover,
            ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(poi.name ?? '',
                    style: Theme.of(context).textTheme.titleLarge),
                if (poi.deck != null) Text('Deck ${poi.deck}'),
                const SizedBox(height: 12),
                if (poi.teaser != null)
                  Html(
                    data: poi.teaser!,
                    style: {'p': Style(fontWeight: FontWeight.bold)},
                  ),
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

            return ListView(
              padding: const EdgeInsets.all(8),
              children: [
                for (final entry in categories.entries) ...[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 12, 8, 4),
                    child: Text(
                      entry.key,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  ...entry.value.map((item) => _SpaCard(
                        item: item,
                        baseUrl: baseUrl,
                      )),
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
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => _showDetail(context),
        child: ListTile(
          leading: item.image != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: '$baseUrl${item.image}',
                    width: 56,
                    height: 56,
                    fit: BoxFit.cover,
                    errorWidget: (_, __, ___) => const Icon(Icons.spa),
                  ),
                )
              : const Icon(Icons.spa),
          title: Text(item.name ?? ''),
          subtitle: item.locationName != null ? Text(item.locationName!) : null,
          trailing: item.bookable == true
              ? const Icon(Icons.bookmark_add_outlined)
              : const Icon(Icons.chevron_right),
        ),
      ),
    );
  }

  void _showDetail(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => DraggableScrollableSheet(
        initialChildSize: 0.75,
        maxChildSize: 0.95,
        minChildSize: 0.5,
        expand: false,
        builder: (_, ctrl) => ListView(
          controller: ctrl,
          children: [
            if (item.image != null)
              CachedNetworkImage(
                imageUrl: '$baseUrl${item.image}',
                height: 200,
                fit: BoxFit.cover,
              ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name ?? '',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  if (item.locationName != null) Text(item.locationName!),
                  const SizedBox(height: 12),
                  if (item.teaser != null) Html(data: item.teaser!),
                  if (item.description != null) Html(data: item.description!),
                  if (item.additionalInformation?.isNotEmpty == true) ...[
                    const SizedBox(height: 8),
                    Text(
                      'Zusatzinformationen',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
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
