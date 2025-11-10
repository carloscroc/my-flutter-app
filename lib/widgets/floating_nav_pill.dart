import 'dart:ui';

import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';

/// Floating centered pill navigation with circular primary action.
class FloatingNavPill extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int>? onTabTap;
  final VoidCallback? onCenterTap;
  final VoidCallback? onCenterLongPress;
  final List<Widget> tabs;
  final bool enableBackdrop;

  const FloatingNavPill({
    Key? key,
    this.currentIndex = 0,
    this.onTabTap,
    this.onCenterTap,
    this.onCenterLongPress,
    required this.tabs,
    this.enableBackdrop = false,
  })  : assert(tabs.length % 2 == 0 || tabs.length >= 2),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final pillHeight = 64.0;
    final centerDiameter = 64.0;

    Widget pill = Container(
      height: pillHeight,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(32),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(16, 16, 18, 0.06),
            offset: Offset(0, 6),
            blurRadius: 20,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _buildTabs(context),
      ),
    );

    if (enableBackdrop) {
      pill = ClipRRect(
        borderRadius: BorderRadius.circular(32),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
          child: pill,
        ),
      );
    }

    return SizedBox(
      height: pillHeight + (centerDiameter / 2),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: 8,
            left: 24,
            right: 24,
            child: pill,
          ),
          Positioned(
            bottom: (pillHeight - (centerDiameter / 2)) + 8,
            child: GestureDetector(
              onTap: onCenterTap,
              onLongPress: onCenterLongPress,
              child: Semantics(
                button: true,
                label: 'Primary action, quick log',
                child: Container(
                  width: centerDiameter,
                  height: centerDiameter,
                  decoration: BoxDecoration(
                    color: AppTheme.primaryColor,
                    shape: BoxShape.circle,
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(16, 16, 18, 0.12),
                        offset: Offset(0, 8),
                        blurRadius: 16,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildTabs(BuildContext context) {
    // Split tabs evenly around center button
    final half = (tabs.length / 2).ceil();
    final left = tabs.take(half).toList();
    final right = tabs.skip(half).toList();

    Widget rowFor(List<Widget> items, int offset) => Row(
          mainAxisSize: MainAxisSize.min,
          children: items.asMap().entries.map((entry) {
            final idx = entry.key + offset;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: InkResponse(
                onTap: () => onTabTap?.call(idx),
                radius: 24,
                child: SizedBox(
                  width: 48,
                  height: 48,
                  child: Center(child: entry.value),
                ),
              ),
            );
          }).toList(),
        );

    final leftRow = rowFor(left, 0);
    final rightRow = rowFor(right, left.length);

    return [
      leftRow,
      rightRow,
    ];
  }
}
