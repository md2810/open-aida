import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/providers/providers.dart';
import '../../core/models/account.dart';
import '../../core/models/guest.dart';
import '../../shared/widgets/error_view.dart';

class AccountScreen extends ConsumerWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final guest = ref.watch(authStateProvider);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Konto'),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () => _logout(context, ref),
              tooltip: 'Abmelden',
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Konto'),
              Tab(text: 'E-Mails'),
              Tab(text: 'Gäste'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _AccountTab(guest: guest),
            const _EmailTab(),
            const _GuestListTab(),
          ],
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
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Abmelden'),
          ),
        ],
      ),
    );
    if (confirmed == true && context.mounted) {
      // Clear in-memory token so the next request never sends a stale p_auth.
      ref.read(aidaClientProvider).setToken(null);
      ref.read(authStateProvider.notifier).state = null;
      // GoRouter's refreshListenable will redirect to /login automatically.
    }
  }
}

// ─── Account Tab ─────────────────────────────────────────────────────────────

class _AccountTab extends ConsumerWidget {
  final Guest? guest;
  const _AccountTab({this.guest});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final balanceAsync = ref.watch(balanceProvider);

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Guest profile card
        if (guest != null) ...[
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 32,
                    backgroundColor:
                        Theme.of(context).colorScheme.primaryContainer,
                    child: Text(
                      _initials(guest!),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color:
                            Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${guest!.firstname ?? ''} ${guest!.lastname ?? ''}',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        if (guest!.cabin != null)
                          Text('Kabine ${guest!.cabin}'),
                        if (guest!.loyalty != null)
                          Chip(
                            label: Text(guest!.loyalty!),
                            avatar: const Icon(Icons.star, size: 14),
                            padding: EdgeInsets.zero,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          if (guest!.embarkationDate != null)
            _InfoRow(
              icon: Icons.login,
              label: 'Einschiffung',
              value: guest!.embarkationDate!,
            ),
          if (guest!.disembarkationDate != null)
            _InfoRow(
              icon: Icons.logout,
              label: 'Ausschiffung',
              value: guest!.disembarkationDate!,
            ),
          const SizedBox(height: 16),
        ],

        // Balance card
        balanceAsync.when(
          loading: () => const Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: LoadingView(),
            ),
          ),
          error: (e, _) => ErrorView(error: e),
          data: (resp) => Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    'Kontostand',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${resp.balanceLocalized?.value ?? resp.balance ?? '0,00'} '
                    '${resp.balanceLocalized?.currency ?? 'EUR'}',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  if (resp.credit != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        'Guthaben: ${resp.creditLocalized?.value ?? resp.credit}',
                        style: const TextStyle(color: Colors.green),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  String _initials(Guest g) {
    final f = g.firstname?.isNotEmpty == true ? g.firstname![0] : '';
    final l = g.lastname?.isNotEmpty == true ? g.lastname![0] : '';
    return '$f$l'.toUpperCase();
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
      title: Text(label),
      trailing: Text(value),
      dense: true,
    );
  }
}

// ─── Email Tab ────────────────────────────────────────────────────────────────

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
              return const Center(child: Text('Keine E-Mails vorhanden.'));
            }
            return ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: resp.data.length,
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
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => _showEmail(context),
        child: ListTile(
          leading: const CircleAvatar(
            child: Icon(Icons.mail_outline),
          ),
          title: Text(email.emailSubject ?? '(Kein Betreff)'),
          subtitle: email.receivedDateLocalized?.datetime != null
              ? Text(email.receivedDateLocalized!.datetime!)
              : null,
          trailing: const Icon(Icons.chevron_right),
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
          padding: const EdgeInsets.all(16),
          children: [
            Text(
              email.emailSubject ?? '(Kein Betreff)',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            if (email.receivedDateLocalized?.datetime != null)
              Text(
                email.receivedDateLocalized!.datetime!,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            const Divider(height: 24),
            SelectableText(email.emailMessage ?? ''),
          ],
        ),
      ),
    );
  }
}

// ─── Guest List Tab ───────────────────────────────────────────────────────────

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
              return const Center(child: Text('Keine Mitreisenden gefunden.'));
            }
            return ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: resp.data.length,
              itemBuilder: (_, i) {
                final g = resp.data[i];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor:
                          Theme.of(context).colorScheme.primaryContainer,
                      child: Text(
                        _initials(g),
                        style: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .onPrimaryContainer,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    title: Text(
                        '${g.firstname ?? ''} ${g.lastname ?? ''}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (g.cabin != null) Text('Kabine ${g.cabin}'),
                        if (g.loyalty != null)
                          Row(
                            children: [
                              const Icon(Icons.star, size: 12),
                              const SizedBox(width: 2),
                              Text(g.loyalty!,
                                  style: const TextStyle(fontSize: 12)),
                            ],
                          ),
                      ],
                    ),
                    isThreeLine:
                        g.cabin != null && g.loyalty != null,
                    trailing: g.age != null
                        ? Text('${g.age} J.',
                            style:
                                Theme.of(context).textTheme.bodySmall)
                        : null,
                  ),
                );
              },
            );
          },
        );
  }

  String _initials(Guest g) {
    final f = g.firstname?.isNotEmpty == true ? g.firstname![0] : '';
    final l = g.lastname?.isNotEmpty == true ? g.lastname![0] : '';
    return '$f$l'.toUpperCase();
  }
}
