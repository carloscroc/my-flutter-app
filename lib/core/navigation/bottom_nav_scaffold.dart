import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/floating_nav_pill.dart';

class BottomNavScaffold extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const BottomNavScaffold({
    super.key,
    required this.navigationShell,
  });

  void _onTap(BuildContext context, int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          navigationShell,
          // Centered floating pill navigation overlay
          Positioned(
            left: 0,
            right: 0,
            bottom: 12,
            child: SafeArea(
              top: false,
              child: Center(
                child: FloatingNavPill(
                  tabs: const [
                    // Left side: Home, Workouts
                    Icon(Icons.home_outlined),
                    Icon(Icons.fitness_center_outlined),
                    // Right side: Meals, Community
                    Icon(Icons.restaurant_outlined),
                    Icon(Icons.people_outline),
                  ],
                  onTabTap: (idx) {
                    // Map pill tab indices to app branches:
                    // 0 -> 0 (Home), 1 -> 1 (Workouts), 2 -> 2 (Meals), 3 -> 3 (Community)
                    final mapping = {0: 0, 1: 1, 2: 2, 3: 3};
                    final branch = mapping[idx] ?? 0;
                    _onTap(context, branch);
                  },
                  // Center (+) button: intentionally no-op for now
                  onCenterTap: null,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
