import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/models/ship_config.dart';
import '../../core/providers/providers.dart';
import '../../shared/theme/app_theme.dart';
import 'ship_detection_service.dart';

final _detectionServiceProvider = Provider<ShipDetectionService>((ref) {
  return ShipDetectionService(ref.watch(sharedPreferencesProvider));
});

final _detectionStateProvider =
    StateNotifierProvider<_DetectionNotifier, _DetectionState>(
  (ref) => _DetectionNotifier(ref.watch(_detectionServiceProvider), ref),
);

enum _DetectionStatus { idle, detecting, success, error }

class _DetectionState {
  final _DetectionStatus status;
  final String? shipName;
  final String? error;
  const _DetectionState({required this.status, this.shipName, this.error});
}

class _DetectionNotifier extends StateNotifier<_DetectionState> {
  final ShipDetectionService _service;
  final Ref _ref;

  _DetectionNotifier(this._service, this._ref)
      : super(const _DetectionState(status: _DetectionStatus.idle));

  Future<void> detect() async {
    state = const _DetectionState(status: _DetectionStatus.detecting);
    try {
      final ship = await _service.detectShip();
      _ref.read(shipNameProvider.notifier).state = ship;
      _ref.read(aidaClientProvider).updateShip(ship);
      state = _DetectionState(status: _DetectionStatus.success, shipName: ship);
    } catch (e) {
      state = _DetectionState(status: _DetectionStatus.error, error: e.toString());
    }
  }

  Future<void> setManual(String ship) async {
    await _service.setShipManually(ship);
    _ref.read(shipNameProvider.notifier).state = ship;
    _ref.read(aidaClientProvider).updateShip(ship);
    state = _DetectionState(status: _DetectionStatus.success, shipName: ship);
  }
}

// ─────────────────────────────────────────────────────────────────────────────

class ShipDetectionScreen extends ConsumerStatefulWidget {
  const ShipDetectionScreen({super.key});

  @override
  ConsumerState<ShipDetectionScreen> createState() => _ShipDetectionScreenState();
}

class _ShipDetectionScreenState extends ConsumerState<ShipDetectionScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _pulse;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _pulse = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);
    _scale = Tween(begin: 0.95, end: 1.05).animate(
      CurvedAnimation(parent: _pulse, curve: Curves.easeInOut),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(_detectionStateProvider.notifier).detect();
    });
  }

  @override
  void dispose() {
    _pulse.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(_detectionStateProvider);
    final cs = Theme.of(context).colorScheme;

    ref.listen(_detectionStateProvider, (_, next) {
      if (next.status == _DetectionStatus.success) {
        _pulse.stop();
        context.go('/login');
      }
    });

    return Scaffold(
      backgroundColor: cs.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              const Spacer(flex: 2),
              // ── Hero logo ──────────────────────────────────────────────────
              ScaleTransition(
                scale: _scale,
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [AppTheme.aidaRed, const Color(0xFF880000)],
                    ),
                    borderRadius: BorderRadius.circular(32),
                    boxShadow: [
                      BoxShadow(
                        color: AppTheme.aidaRed.withValues(alpha: 0.35),
                        blurRadius: 24,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.directions_boat_rounded,
                    size: 64,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 28),
              Text(
                'OpenAIDA',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: AppTheme.aidaRed,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.5,
                    ),
              ),
              const SizedBox(height: 6),
              Text(
                'Dein AIDA Bordportal',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: cs.onSurfaceVariant,
                    ),
              ),
              const Spacer(flex: 1),

              // ── Status area ───────────────────────────────────────────────
              _StatusArea(state: state),

              const Spacer(flex: 2),

              // ── Manual picker button ───────────────────────────────────────
              if (state.status != _DetectionStatus.detecting)
                TextButton.icon(
                  onPressed: () => _showManualPicker(context),
                  icon: const Icon(Icons.list_rounded, size: 18),
                  label: const Text('Schiff manuell wählen'),
                ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  void _showManualPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => _ShipPickerSheet(
        onSelected: (ship) {
          Navigator.pop(context);
          ref.read(_detectionStateProvider.notifier).setManual(ship);
        },
      ),
    );
  }
}

// ── Status area widget ────────────────────────────────────────────────────────

class _StatusArea extends ConsumerWidget {
  final _DetectionState state;
  const _StatusArea({required this.state});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cs = Theme.of(context).colorScheme;

    switch (state.status) {
      case _DetectionStatus.detecting:
        return Column(
          children: [
            SizedBox(
              width: 32,
              height: 32,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                color: cs.primary,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Schiff wird erkannt…',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: cs.onSurfaceVariant,
                  ),
            ),
          ],
        );

      case _DetectionStatus.error:
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: cs.errorContainer,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Icon(Icons.error_outline_rounded, size: 40, color: cs.onErrorContainer),
                  const SizedBox(height: 8),
                  Text(
                    state.error ?? 'Kein AIDA-Netzwerk gefunden',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: cs.onErrorContainer,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            FilledButton.icon(
              onPressed: () =>
                  ref.read(_detectionStateProvider.notifier).detect(),
              icon: const Icon(Icons.refresh_rounded),
              label: const Text('Erneut versuchen'),
            ),
          ],
        );

      case _DetectionStatus.success:
        return Column(
          children: [
            Icon(Icons.check_circle_rounded, size: 40, color: cs.primary),
            const SizedBox(height: 8),
            Text(
              state.shipName != null
                  ? 'AIDA${state.shipName![0].toUpperCase()}${state.shipName!.substring(1)} erkannt'
                  : 'Schiff erkannt',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: cs.primary,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ],
        );

      case _DetectionStatus.idle:
        return FilledButton.icon(
          onPressed: () =>
              ref.read(_detectionStateProvider.notifier).detect(),
          icon: const Icon(Icons.search_rounded),
          label: const Text('Schiff erkennen'),
        );
    }
  }
}

// ── Ship picker bottom sheet ──────────────────────────────────────────────────

class _ShipPickerSheet extends StatelessWidget {
  final void Function(String) onSelected;
  const _ShipPickerSheet({required this.onSelected});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return DraggableScrollableSheet(
      initialChildSize: 0.65,
      maxChildSize: 0.92,
      minChildSize: 0.4,
      expand: false,
      builder: (_, controller) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
            child: Row(
              children: [
                Icon(Icons.directions_boat_rounded, color: cs.primary),
                const SizedBox(width: 12),
                Text(
                  'Schiff wählen',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              controller: controller,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              children: ShipConfig.knownShips.map((ship) {
                final display =
                    'AIDA${ship[0].toUpperCase()}${ship.substring(1)}';
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 3),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: cs.primaryContainer,
                      child: Icon(
                        Icons.directions_boat_rounded,
                        color: cs.onPrimaryContainer,
                        size: 20,
                      ),
                    ),
                    title: Text(display,
                        style: const TextStyle(fontWeight: FontWeight.w500)),
                    subtitle: Text('bordportal.$ship.aida.de',
                        style: Theme.of(context).textTheme.bodySmall),
                    trailing: Icon(Icons.chevron_right, color: cs.onSurfaceVariant),
                    onTap: () => onSelected(ship),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
