import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/providers/providers.dart';
import '../../shared/theme/app_theme.dart';
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

  _LoginNotifier(this._service, this._ref) : super(const _LoginState());

  Future<void> login({
    required String cabin,
    required String surname,
    required String pin,
  }) async {
    state = const _LoginState(loading: true);
    try {
      final guest = await _service.login(cabin: cabin, surname: surname, pin: pin);
      _ref.read(authStateProvider.notifier).state = guest;
      state = const _LoginState();
    } on AuthException catch (e) {
      state = _LoginState(error: e.message);
    } catch (e) {
      state = _LoginState(error: 'Netzwerkfehler: $e');
    }
  }
}

// ─────────────────────────────────────────────────────────────────────────────

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
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    ref.listen(_loginStateProvider, (_, next) {
      if (!next.loading && next.error == null) {
        context.go('/home');
      }
    });

    return Scaffold(
      backgroundColor: cs.surface,
      body: CustomScrollView(
        slivers: [
          // ── Hero header ─────────────────────────────────────────────────
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [AppTheme.aidaRed, const Color(0xFF880000)],
                ),
              ),
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 48,
                bottom: 40,
                left: 24,
                right: 24,
              ),
              child: Column(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.15),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.directions_boat_rounded,
                      size: 44,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'OpenAIDA',
                    style: tt.headlineMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Willkommen an Bord',
                    style: tt.bodyLarge?.copyWith(
                      color: Colors.white.withValues(alpha: 0.85),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ── Login form ──────────────────────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 4),

                    // Cabin
                    TextFormField(
                      controller: _cabinCtrl,
                      decoration: const InputDecoration(
                        labelText: 'Kabinennummer',
                        prefixIcon: Icon(Icons.door_front_door_outlined),
                        hintText: 'z. B. 7142',
                      ),
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      validator: (v) => (v == null || v.isEmpty)
                          ? 'Bitte Kabinennummer eingeben'
                          : null,
                    ),
                    const SizedBox(height: 14),

                    // Surname
                    TextFormField(
                      controller: _surnameCtrl,
                      decoration: const InputDecoration(
                        labelText: 'Nachname',
                        prefixIcon: Icon(Icons.person_outline_rounded),
                        hintText: 'Wie auf Ihrer Bordkarte',
                      ),
                      textCapitalization: TextCapitalization.words,
                      textInputAction: TextInputAction.next,
                      validator: (v) => (v == null || v.isEmpty)
                          ? 'Bitte Nachname eingeben'
                          : null,
                    ),
                    const SizedBox(height: 14),

                    // PIN
                    TextFormField(
                      controller: _pinCtrl,
                      decoration: InputDecoration(
                        labelText: 'PIN (optional)',
                        prefixIcon: const Icon(Icons.lock_outline_rounded),
                        hintText: '4-stellige PIN',
                        suffixIcon: IconButton(
                          icon: Icon(
                            _pinVisible
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                          ),
                          onPressed: () =>
                              setState(() => _pinVisible = !_pinVisible),
                        ),
                      ),
                      obscureText: !_pinVisible,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (_) => _submit(),
                    ),
                    const SizedBox(height: 24),

                    // Error banner
                    if (state.error != null) ...[
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          color: cs.errorContainer,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.error_outline_rounded,
                                color: cs.onErrorContainer, size: 20),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                state.error!,
                                style: tt.bodyMedium?.copyWith(
                                  color: cs.onErrorContainer,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],

                    // Login button
                    ElevatedButton(
                      onPressed: state.loading ? null : _submit,
                      child: state.loading
                          ? const SizedBox(
                              height: 22,
                              width: 22,
                              child: CircularProgressIndicator(
                                strokeWidth: 2.5,
                                color: Colors.white,
                              ),
                            )
                          : const Text('Anmelden'),
                    ),
                    const SizedBox(height: 12),

                    // Change ship
                    OutlinedButton.icon(
                      onPressed: () => context.go('/setup'),
                      icon: const Icon(Icons.directions_boat_outlined, size: 18),
                      label: const Text('Anderes Schiff wählen'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: cs.onSurfaceVariant,
                        side: BorderSide(color: cs.outlineVariant),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      ref.read(_loginStateProvider.notifier).login(
            cabin: _cabinCtrl.text.trim(),
            surname: _surnameCtrl.text.trim(),
            pin: _pinCtrl.text.trim(),
          );
    }
  }
}
