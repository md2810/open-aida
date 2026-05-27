import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/providers/providers.dart';
import 'auth_service.dart';

final _authServiceProvider = Provider<AuthService>((ref) {
  return AuthService(
    ref.watch(aidaApiProvider),
    ref.watch(aidaClientProvider),
    ref.watch(secureStorageProvider),
  );
});

final _loginStateProvider =
    StateNotifierProvider<_LoginNotifier, _LoginState>(
  (ref) => _LoginNotifier(ref.watch(_authServiceProvider), ref),
);

class _LoginState {
  final bool loading;
  final String? error;
  const _LoginState({this.loading = false, this.error});
}

class _LoginNotifier extends StateNotifier<_LoginState> {
  final AuthService _service;
  final Ref _ref;

  _LoginNotifier(this._service, this._ref)
      : super(const _LoginState());

  Future<void> login({
    required String cabin,
    required String surname,
    required String pin,
  }) async {
    state = const _LoginState(loading: true);
    try {
      final guest = await _service.login(
        cabin: cabin,
        surname: surname,
        pin: pin,
      );
      _ref.read(authStateProvider.notifier).state = guest;
      state = const _LoginState();
    } on AuthException catch (e) {
      state = _LoginState(error: e.message);
    } catch (e) {
      state = _LoginState(error: 'Netzwerkfehler: $e');
    }
  }
}

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _cabinCtrl = TextEditingController();
  final _surnameCtrl = TextEditingController();
  final _pinCtrl = TextEditingController();
  bool _pinVisible = false;

  @override
  void dispose() {
    _cabinCtrl.dispose();
    _surnameCtrl.dispose();
    _pinCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(_loginStateProvider);

    ref.listen(_loginStateProvider, (_, next) {
      if (!next.loading && next.error == null) {
        context.go('/home');
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Anmelden'),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 24),
                Icon(
                  Icons.directions_boat,
                  size: 64,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(height: 8),
                Text(
                  'Willkommen an Bord',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 32),

                // Cabin number
                TextFormField(
                  controller: _cabinCtrl,
                  decoration: const InputDecoration(
                    labelText: 'Kabinennummer',
                    prefixIcon: Icon(Icons.door_front_door_outlined),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (v) => (v == null || v.isEmpty)
                      ? 'Bitte Kabinennummer eingeben'
                      : null,
                ),
                const SizedBox(height: 16),

                // Surname
                TextFormField(
                  controller: _surnameCtrl,
                  decoration: const InputDecoration(
                    labelText: 'Nachname',
                    prefixIcon: Icon(Icons.person_outline),
                  ),
                  textCapitalization: TextCapitalization.words,
                  validator: (v) => (v == null || v.isEmpty)
                      ? 'Bitte Nachname eingeben'
                      : null,
                ),
                const SizedBox(height: 16),

                // PIN (optional)
                TextFormField(
                  controller: _pinCtrl,
                  decoration: InputDecoration(
                    labelText: 'PIN (optional)',
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(_pinVisible
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: () =>
                          setState(() => _pinVisible = !_pinVisible),
                    ),
                  ),
                  obscureText: !_pinVisible,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 24),

                // Error message
                if (state.error != null)
                  Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .errorContainer,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      state.error!,
                      style: TextStyle(
                        color: Theme.of(context)
                            .colorScheme
                            .onErrorContainer,
                      ),
                    ),
                  ),

                // Login button
                ElevatedButton(
                  onPressed: state.loading
                      ? null
                      : () {
                          if (_formKey.currentState!.validate()) {
                            ref.read(_loginStateProvider.notifier).login(
                                  cabin: _cabinCtrl.text.trim(),
                                  surname: _surnameCtrl.text.trim(),
                                  pin: _pinCtrl.text.trim(),
                                );
                          }
                        },
                  child: state.loading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Text('Anmelden'),
                ),

                const SizedBox(height: 16),
                TextButton(
                  onPressed: () => context.go('/setup'),
                  child: const Text('Anderes Schiff wählen'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
