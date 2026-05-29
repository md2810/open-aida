import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/providers/providers.dart';
import '../../core/models/guest.dart';
import '../../shared/theme/app_theme.dart';
import '../../shared/widgets/error_view.dart';

class AccountScreen extends ConsumerWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final guest = ref.watch(authStateProvider);

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            expandedHeight: guest != null ? 160 : 80,
            pinned: true,
            stretch: true,
            backgroundColor: const Color(0xFF3E2E00),
            foregroundColor: Colors.white,
            actions: [
              IconButton(
                icon: const Icon(Icons.logout_rounded),
                onPressed: () => _logout(context, ref),
                tooltip: 'Abmelden',
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: _ProfileHeader(guest: guest),
            ),
          ),
        ],
        body: const _AccountBody(),
      ),
    );
  }

  void _logout(BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Abmelden'),
        content: const Text('Möchtest du dich wirklich abmelden?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Abbrechen'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Abmelden'),
          ),
        ],
      ),
    );
    if (confirmed == true && context.mounted) {
      ref.read(aidaClientProvider).clearSession();
      ref.read(authStateProvider.notifier).state = null;
    }
  }
}

// ── Profile header ─────────────────────────────────────────────────────────

class _ProfileHeader extends StatelessWidget {
  final Guest? guest;
  const _ProfileHeader({this.guest});

  @override
  Widget build(BuildContext context) {
    if (guest == null) {
      return Container(
        decoration: const BoxDecoration(gradient: AppTheme.gradAccount),
      );
    }

    final initials = _initials(guest!);

    return Container(
      decoration: const BoxDecoration(gradient: AppTheme.gradAccount),
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 56,
        bottom: 16,
        left: 20,
        right: 20,
      ),
      child: Row(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0x443E2E00),
              border: Border.all(
                color: const Color(0x553E2E00),
                width: 2,
              ),
            ),
            child: Center(
              child: Text(
                initials,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF3E2E00),
                ),
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${guest!.firstname ?? ''} ${guest!.lastname ?? ''}'.trim(),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF3E2E00),
                    letterSpacing: -0.3,
                  ),
                ),
                if (guest!.cabin != null)
                  Text(
                    'Kabine ${guest!.cabin}',
                    style: const TextStyle(
                      color: Color(0x993E2E00),
                      fontSize: 14,
                    ),
                  ),
                if (guest!.loyalty != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 3),
                      decoration: BoxDecoration(
                        color: const Color(0x333E2E00),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.star_rounded,
                              size: 13, color: Color(0xFF3E2E00)),
                          const SizedBox(width: 4),
                          Text(
                            guest!.loyalty!,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xFF3E2E00),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _initials(Guest g) {
    final f = g.firstname?.isNotEmpty == true ? g.firstname![0] : '';
    final l = g.lastname?.isNotEmpty == true ? g.lastname![0] : '';
    return '$f$l'.toUpperCase();
  }
}

// ── Account body ──────────────────────────────────────────────────────────────

class _AccountBody extends ConsumerWidget {
  const _AccountBody();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final guest = ref.watch(authStateProvider);
    final balanceAsync = ref.watch(balanceProvider);
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 100),
      children: [
        // ── Balance card ──────────────────────────────────────────────────
        balanceAsync.when(
          loading: () => Container(
            height: 130,
            decoration: BoxDecoration(
              gradient: AppTheme.gradAccount,
              borderRadius: BorderRadius.circular(28),
            ),
            child: const Center(child: LoadingView()),
          ),
          error: (e, _) => ErrorView(error: e),
          data: (resp) => Container(
            decoration: BoxDecoration(
              gradient: AppTheme.gradAccount,
              borderRadius: BorderRadius.circular(28),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFFF9F1C).withValues(alpha: 0.4),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            padding: const EdgeInsets.fromLTRB(22, 20, 22, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'BORDKONTO',
                      style: tt.labelSmall?.copyWith(
                        color: const Color(0xFF3E2E00).withValues(alpha: 0.65),
                        letterSpacing: 1.6,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Icon(
                      Icons.sailing_rounded,
                      size: 22,
                      color: Color(0x443E2E00),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '${resp.balanceLocalized?.value ?? resp.balance ?? '0,00'} '
                    '${resp.balanceLocalized?.currency ?? 'EUR'}',
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF3E2E00),
                      letterSpacing: -1.5,
                      height: 1.0,
                    ),
                  ),
                ),
                if (resp.credit != null) ...[
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 5),
                    decoration: BoxDecoration(
                      color: const Color(0x223E2E00),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.add_circle_outline_rounded,
                            size: 13, color: Color(0xFF3E2E00)),
                        const SizedBox(width: 5),
                        Text(
                          'Guthaben: ${resp.creditLocalized?.value ?? resp.credit}',
                          style: tt.bodySmall?.copyWith(
                            color: const Color(0xFF3E2E00).withValues(alpha: 0.85),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),

        const SizedBox(height: 20),

        // ── Trip dates ────────────────────────────────────────────────────
        if (guest?.embarkationDate != null || guest?.disembarkationDate != null)
          Container(
            decoration: BoxDecoration(
              color: cs.surfaceContainerLow,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: cs.outlineVariant.withValues(alpha: 0.4)),
            ),
            child: Column(
              children: [
                if (guest!.embarkationDate != null)
                  ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(9),
                      decoration: BoxDecoration(
                        color: cs.primaryContainer,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(Icons.login_rounded,
                          color: cs.onPrimaryContainer, size: 20),
                    ),
                    title: const Text(
                      'Einschiffung',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(guest.embarkationDate!),
                  ),
                if (guest.embarkationDate != null &&
                    guest.disembarkationDate != null)
                  Divider(
                    indent: 16,
                    endIndent: 16,
                    color: cs.outlineVariant.withValues(alpha: 0.5),
                    height: 1,
                  ),
                if (guest.disembarkationDate != null)
                  ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(9),
                      decoration: BoxDecoration(
                        color: cs.secondaryContainer,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(Icons.logout_rounded,
                          color: cs.onSecondaryContainer, size: 20),
                    ),
                    title: const Text(
                      'Ausschiffung',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(guest.disembarkationDate!),
                  ),
              ],
            ),
          ),
      ],
    );
  }
}
