import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/citizen_bottom_nav_bar.dart';

/// Stateful shell wrapper for Citizen Main Navigation across 5 tabs.
class CitizenMainShell extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const CitizenMainShell({
    super.key,
    required this.navigationShell,
  });

  void _onTap(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: CitizenBottomNavBar(
        currentIndex: navigationShell.currentIndex,
        onTap: _onTap,
      ),
    );
  }
}
