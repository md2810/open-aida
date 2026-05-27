import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/providers/providers.dart';
import '../../core/models/account.dart';
import '../../core/models/guest.dart';
import '../../shared/theme/app_theme.dart';
import '../../shared/widgets/error_view.dart';

class AccountScreen extends ConsumerWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final guest = ref.watch(authStateProvider);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              expandedHeight: guest != null ? 200 : 120,
              pinned: true,
              stretch: true,
              backgroundColor: AppTheme.aidaRed,
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
              bottom: const TabBar(
                tabs: [
                  Tab(text: 'Konto'),
                  Tab(text: 'E-Mails'),
                  Tab(text: 'Gäste'),
                ],
              ),
            ),
          ],
          body: const TabBarView(
            children: [
              _AccountTab(),
              _EmailTab(),
              _GuestListTab(),
            ],
          ),
        ),
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
      ref.read(aidaClientProvider).setToken(null);
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
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppTheme.aidaRed, Color(0xFF880000)],
          ),
        ),
      );
    }

    final initials = _initials(guest!);

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppTheme.aidaRed, Color(0xFF880000)],
        ),
      ),
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 56,
        bottom: 52, // space for TabBar
        left: 20,
        right: 20,
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 36,
            backgroundColor: Colors.white.withValues(alpha: 0.2),
            child: Text(
              initials,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${guest!.firstname ?? ''} ${guest!.lastname ?? ''}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                if (guest!.cabin != null)
                  Text(
                    'Kabine ${guest!.cabin}',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.85),
                      fontSize: 14,
                    ),
                  ),
                if (guest!.loyalty != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 3),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: Colors.white.withValues(alpha: 0.4)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.star_rounded,
                              size: 14, color: Colors.white),
                          const SizedBox(width: 4),
                          Text(
                            guest!.loyalty!,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
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

// ── Account Tab ──────────────────────────────────────────────────────────────

class _AccountTab extends ConsumerWidget {
  const _AccountTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final guest = ref.watch(authStateProvider);
    final balanceAsync = ref.watch(balanceProvider);
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
      children: [
        // Balance card
        balanceAsync.when(
          loading: () => const Card(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: LoadingView(),
            ),
          ),
          error: (e, _) => ErrorView(error: e),
          data: (resp) => Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [cs.primaryContainer, cs.primaryContainer.withValues(alpha: 0.6)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.account_balance_wallet_rounded,
                        color: cs.onPrimaryContainer, size: 20),
                    const SizedBox(width: 8),
                    Text(
                      'Bordkonto',
                      style: tt.titleSmall?.copyWith(
                        color: cs.onPrimaryContainer,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  '${resp.balanceLocalized?.value ?? resp.balance ?? '0,00'} '
                  '${resp.balanceLocalized?.currency ?? 'EUR'}',
                  style: tt.headlineMedium?.copyWith(
                    color: cs.onPrimaryContainer,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                if (resp.credit != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Row(
                      children: [
                        Icon(Icons.add_circle_rounded,
                            size: 14, color: cs.onPrimaryContainer.withValues(alpha: 0.7)),
                        const SizedBox(width: 4),
                        Text(
                          'Guthaben: ${resp.creditLocalized?.value ?? resp.credit}',
                          style: tt.bodySmall?.copyWith(
                            color: cs.onPrimaryContainer.withValues(alpha: 0.85),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Trip dates
        if (guest?.embarkationDate != null || guest?.disembarkationDate != null) ...[
          Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
              child: Column(
                children: [
                  if (guest!.embarkationDate != null)
                    ListTile(
                      leading: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: cs.primaryContainer,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(Icons.login_rounded,
                            color: cs.onPrimaryContainer, size: 20),
                      ),
                      title: const Text('Einschiffung'),
                      subtitle: Text(guest.embarkationDate!),
                    ),
                  if (guest.embarkationDate != null &&
                      guest.disembarkationDate != null)
                    Divider(
                      indent: 16,
                      endIndent: 16,
                      color: cs.outlineVariant,
                    ),
                  if (guest.disembarkationDate != null)
                    ListTile(
                      leading: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: cs.primaryContainer,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(Icons.logout_rounded,
                            color: cs.onPrimaryContainer, size: 20),
                      ),
                      title: const Text('Ausschiffung'),
                      subtitle: Text(guest.disembarkationDate!),
                    ),
                ],
              ),
            ),
          ),
        ],
      ],
    );
  }
}

// ── Email Tab ─────────────────────────────────────────────────────────────────

class _EmailTab extends ConsumerWidget {
  const _EmailTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(emailListProvider).when(
          loading: () => const LoadingView(),
          error: (e, _) => ErrorView(
            error: e,
            onRetry: () => ref.invalidate(emailListProvider),
          ),
          data: (resp) {
            if (resp.data.isEmpty) {
              return _EmptyState(
                icon: Icons.mail_outline_rounded,
                message: 'Keine E-Mails vorhanden.',
              );
            }
            return ListView.separated(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 100),
              itemCount: resp.data.length,
              separatorBuilder: (_, __) => const SizedBox(height: 4),
              itemBuilder: (_, i) => _EmailCard(email: resp.data[i]),
            );
          },
        );
  }
}

class _EmailCard extends StatelessWidget {
  final Email email;
  const _EmailCard({required this.email});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => _showEmail(context),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: cs.primaryContainer,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.mail_rounded,
                    color: cs.onPrimaryContainer, size: 22),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      email.emailSubject ?? '(Kein Betreff)',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (email.receivedDateLocalized?.datetime != null)
                      Text(
                        email.receivedDateLocalized!.datetime!,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                  ],
                ),
              ),
              Icon(Icons.chevron_right_rounded, color: cs.onSurfaceVariant),
            ],
          ),
        ),
      ),
    );
  }

  void _showEmail(BuildContext context) {
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
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 40),
          children: [
            Center(
              child: Container(
                width: 36,
                height: 4,
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            Text(
              email.emailSubject ?? '(Kein Betreff)',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            if (email.receivedDateLocalized?.datetime != null)
              Padding(
                padding: const EdgeInsets.only(top: 4, bottom: 16),
                child: Text(
                  email.receivedDateLocalized!.datetime!,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            const Divider(),
            const SizedBox(height: 12),
            SelectableText(
              email.emailMessage ?? '',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}

// ── Guest List Tab ────────────────────────────────────────────────────────────

class _GuestListTab extends ConsumerWidget {
  const _GuestListTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(guestListProvider).when(
          loading: () => const LoadingView(),
          error: (e, _) => ErrorView(
            error: e,
            onRetry: () => ref.invalidate(guestListProvider),
          ),
          data: (resp) {
            if (resp.data.isEmpty) {
              return _EmptyState(
                icon: Icons.group_outlined,
                message: 'Keine Mitreisenden gefunden.',
              );
            }
            return ListView.separated(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 100),
              itemCount: resp.data.length,
              separatorBuilder: (_, __) => const SizedBox(height: 4),
              itemBuilder: (_, i) => _GuestCard(guest: resp.data[i]),
            );
          },
        );
  }
}

class _GuestCard extends StatelessWidget {
  final Guest guest;
  const _GuestCard({required this.guest});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final initials = _initials(guest);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: cs.primaryContainer,
              child: Text(
                initials,
                style: TextStyle(
                  color: cs.onPrimaryContainer,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${guest.firstname ?? ''} ${guest.lastname ?? ''}',
                    style: tt.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  if (guest.cabin != null)
                    Text('Kabine ${guest.cabin}', style: tt.bodySmall),
                  if (guest.loyalty != null)
                    Row(
                      children: [
                        Icon(Icons.star_rounded, size: 12, color: cs.tertiary),
                        const SizedBox(width: 3),
                        Text(guest.loyalty!,
                            style: tt.bodySmall?.copyWith(color: cs.tertiary)),
                      ],
                    ),
                ],
              ),
            ),
            if (guest.age != null)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: cs.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '${guest.age} J.',
                  style: tt.labelSmall?.copyWith(fontWeight: FontWeight.w600),
                ),
              ),
          ],
        ),
      ),
    );
  }

  String _initials(Guest g) {
    final f = g.firstname?.isNotEmpty == true ? g.firstname![0] : '';
    final l = g.lastname?.isNotEmpty == true ? g.lastname![0] : '';
    return '$f$l'.toUpperCase();
  }
}

// ── Empty state ───────────────────────────────────────────────────────────────

class _EmptyState extends StatelessWidget {
  final IconData icon;
  final String message;
  const _EmptyState({required this.icon, required this.message});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 56, color: cs.onSurfaceVariant.withValues(alpha: 0.4)),
          const SizedBox(height: 16),
          Text(
            message,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: cs.onSurfaceVariant,
                ),
          ),
        ],
      ),
    );
  }
}
