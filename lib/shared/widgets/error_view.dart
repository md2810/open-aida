import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  final Object error;
  final VoidCallback? onRetry;

  const ErrorView({super.key, required this.error, this.onRetry});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    String friendly(Object e) {
      final s = e.toString();
      if (s.contains('401')) return 'Sitzung abgelaufen – bitte erneut anmelden.';
      if (s.contains('403')) return 'Zugriff verweigert.';
      if (s.contains('404')) return 'Inhalte nicht gefunden.';
      if (s.contains('SocketException') || s.contains('Connection refused')) {
        return 'Kein Netzwerk – bitte WLAN an Bord prüfen.';
      }
      if (s.contains('DioException') || s.contains('TimeoutException')) {
        return 'Verbindung zum Server fehlgeschlagen.';
      }
      return s.length > 120 ? '${s.substring(0, 120)}…' : s;
    }

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Error icon with container
            Container(
              width: 88,
              height: 88,
              decoration: BoxDecoration(
                color: cs.errorContainer,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.wifi_off_rounded,
                size: 44,
                color: cs.onErrorContainer,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Verbindungsfehler',
              style: tt.titleLarge?.copyWith(
                color: cs.onSurface,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              friendly(error),
              style: tt.bodyMedium?.copyWith(color: cs.onSurfaceVariant),
              textAlign: TextAlign.center,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
            if (onRetry != null) ...[
              const SizedBox(height: 28),
              FilledButton.tonalIcon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh_rounded),
                label: const Text('Erneut versuchen'),
                style: FilledButton.styleFrom(
                  minimumSize: const Size(220, 48),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: Theme.of(context).colorScheme.primary,
        strokeWidth: 3,
      ),
    );
  }
}
