import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/models/ship_config.dart';
import '../../core/providers/providers.dart';
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

  const _DetectionState({
    required this.status,
    this.shipName,
    this.error,
  });
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
      state = _DetectionState(
        status: _DetectionStatus.error,
        error: e.toString(),
      );
    }
  }

  Future<void> setManual(String ship) async {
    await _service.setShipManually(ship);
    _ref.read(shipNameProvider.notifier).state = ship;
    _ref.read(aidaClientProvider).updateShip(ship);
    state = _DetectionState(status: _DetectionStatus.success, shipName: ship);
  }
}

class ShipDetectionScreen extends ConsumerStatefulWidget {
  const ShipDetectionScreen({super.key});

  @override
  ConsumerState<ShipDetectionScreen> createState() =>
      _ShipDetectionScreenState();
}

class _ShipDetectionScreenState extends ConsumerState<ShipDetectionScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(_detectionStateProvider.notifier).detect();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(_detectionStateProvider);
    final cs = Theme.of(context).colorScheme;

    ref.listen(_detectionStateProvider, (_, next) {
      if (next.status == _DetectionStatus.success) {
        context.go('/login');
      }
    });

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Logo / Branding
              Icon(Icons.directions_boat,
                  size: 80, color: cs.primary),
              const SizedBox(height: 24),
              Text(
                'OpenAIDA',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: cs.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                'Dein AIDA Bordportal',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 48),

              // Status
              if (state.status == _DetectionStatus.detecting) ...[
                const CircularProgressIndicator.adaptive(),
                const SizedBox(height: 16),
                const Text('Schiff wird erkannt…', textAlign: TextAlign.center),
              ],

              if (state.status == _DetectionStatus.error) ...[
                Icon(Icons.error_outline, size: 48, color: cs.error),
                const SizedBox(height: 16),
                Text(
                  state.error ?? 'Unbekannter Fehler',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: cs.error),
                ),
                const SizedBox(height: 24),
                ElevatedButton.icon(
                  onPressed: () =>
                      ref.read(_detectionStateProvider.notifier).detect(),
                  icon: const Icon(Icons.refresh),
                  label: const Text('Erneut versuchen'),
                ),
                const SizedBox(height: 12),
                OutlinedButton.icon(
                  onPressed: () => _showManualPicker(context),
                  icon: const Icon(Icons.list),
                  label: const Text('Schiff manuell wählen'),
                ),
              ],

              if (state.status == _DetectionStatus.idle) ...[
                ElevatedButton(
                  onPressed: () =>
                      ref.read(_detectionStateProvider.notifier).detect(),
                  child: const Text('Schiff erkennen'),
                ),
              ],

              const SizedBox(height: 16),
              TextButton(
                onPressed: () => _showManualPicker(context),
                child: const Text('Anderes Schiff?'),
              ),
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

class _ShipPickerSheet extends StatelessWidget {
  final void Function(String) onSelected;
  const _ShipPickerSheet({required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      maxChildSize: 0.9,
      minChildSize: 0.4,
      expand: false,
      builder: (_, controller) => Column(
        children: [
          const SizedBox(height: 8),
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 16),
          Text('Schiff wählen',
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          Expanded(
            child: ListView(
              controller: controller,
              children: ShipConfig.knownShips.map((ship) {
                final name = 'AIDA${ship[0].toUpperCase()}${ship.substring(1)}';
                return ListTile(
                  leading: const Icon(Icons.directions_boat),
                  title: Text(name),
                  subtitle: Text('bordportal.$ship.aida.de'),
                  onTap: () => onSelected(ship),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
