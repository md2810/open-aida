import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/providers.dart';
import '../../features/ship_detection/ship_detection_screen.dart';
import '../../features/auth/login_screen.dart';
import '../../features/home/home_screen.dart';
import '../../features/program/program_screen.dart';
import '../../features/my_vacation/my_vacation_screen.dart';
import '../../features/discover/discover_screen.dart';
import '../../features/account/account_screen.dart';
import '../../shared/widgets/main_shell.dart';

/// A [ChangeNotifier] that notifies GoRouter whenever auth or ship state
/// changes, so the redirect is re-evaluated without an explicit navigation.
class _RouterNotifier extends ChangeNotifier {
  _RouterNotifier(Ref ref) {
    ref.listen(isLoggedInProvider, (_, __) => notifyListeners());
    ref.listen(shipNameProvider, (_, __) => notifyListeners());
  }
}

final routerProvider = Provider<GoRouter>((ref) {
  final notifier = _RouterNotifier(ref);
  ref.onDispose(notifier.dispose);

  return GoRouter(
    initialLocation: '/home',
    refreshListenable: notifier,
    redirect: (context, state) {
      final ship = ref.read(shipNameProvider);
      final loggedIn = ref.read(isLoggedInProvider);

      final location = state.matchedLocation;

      // Need ship detection first
      if (ship == null && location != '/setup') {
        return '/setup';
      }

      // Need login for protected routes
      if (!loggedIn &&
          location != '/login' &&
          location != '/setup') {
        return '/login';
      }

      // Logged-in users shouldn't linger on login/setup screens
      if (loggedIn &&
          (location == '/login' || location == '/setup')) {
        return '/home';
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/setup',
        builder: (_, __) => const ShipDetectionScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (_, __) => const LoginScreen(),
      ),
      ShellRoute(
        builder: (context, state, child) => MainShell(child: child),
        routes: [
          GoRoute(
            path: '/home',
            pageBuilder: (_, __) =>
                const NoTransitionPage(child: HomeScreen()),
          ),
          GoRoute(
            path: '/program',
            pageBuilder: (_, __) =>
                const NoTransitionPage(child: ProgramScreen()),
          ),
          GoRoute(
            path: '/vacation',
            pageBuilder: (_, __) =>
                const NoTransitionPage(child: MyVacationScreen()),
          ),
          GoRoute(
            path: '/discover',
            pageBuilder: (_, __) =>
                const NoTransitionPage(child: DiscoverScreen()),
          ),
          GoRoute(
            path: '/account',
            pageBuilder: (_, __) =>
                const NoTransitionPage(child: AccountScreen()),
          ),
        ],
      ),
    ],
  );
});
