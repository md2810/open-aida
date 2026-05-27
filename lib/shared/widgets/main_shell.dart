import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainShell extends StatelessWidget {
  final Widget child;

  const MainShell({super.key, required this.child});

  static const _tabs = [
    (path: '/home', icon: Icons.home_outlined, activeIcon: Icons.home, label: 'Home'),
    (path: '/program', icon: Icons.event_outlined, activeIcon: Icons.event, label: 'Programm'),
    (path: '/vacation', icon: Icons.beach_access_outlined, activeIcon: Icons.beach_access, label: 'Mein Urlaub'),
    (path: '/discover', icon: Icons.explore_outlined, activeIcon: Icons.explore, label: 'Entdecken'),
    (path: '/account', icon: Icons.person_outlined, activeIcon: Icons.person, label: 'Konto'),
  ];

  int _selectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).matchedLocation;
    final idx = _tabs.indexWhere((t) => location.startsWith(t.path));
    return idx >= 0 ? idx : 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex(context),
        onDestinationSelected: (i) => context.go(_tabs[i].path),
        destinations: _tabs.map((t) => NavigationDestination(
          icon: Icon(t.icon),
          selectedIcon: Icon(t.activeIcon),
          label: t.label,
        )).toList(),
      ),
    );
  }
}
