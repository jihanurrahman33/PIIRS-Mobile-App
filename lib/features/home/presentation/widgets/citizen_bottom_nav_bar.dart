import 'package:flutter/material.dart';

import 'citizen_bottom_nav_items_row.dart';

/// Reusable redesigned Bottom Navigation Bar for Citizen Main Shell with 5 items.
class CitizenBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CitizenBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final borderColor = theme.colorScheme.outlineVariant.withValues(
      alpha: isDark ? 0.25 : 0.4,
    );

    return Container(
      decoration: BoxDecoration(
        color: theme.cardColor,
        border: Border(top: BorderSide(color: borderColor, width: 0.8)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.25 : 0.04),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 60,
          child: CitizenBottomNavItemsRow(
            currentIndex: currentIndex,
            onTap: onTap,
          ),
        ),
      ),
    );
  }
}
