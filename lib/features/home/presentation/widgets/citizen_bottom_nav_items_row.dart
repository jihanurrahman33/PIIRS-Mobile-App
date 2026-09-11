import 'package:flutter/material.dart';

import 'citizen_bottom_nav_center_button.dart';
import 'citizen_bottom_nav_item.dart';

/// Row assembling the 5 interactive tab destinations for the citizen shell.
class CitizenBottomNavItemsRow extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CitizenBottomNavItemsRow({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  Widget _tab(int i, IconData active, IconData inactive, String label) {
    return Expanded(
      child: CitizenBottomNavItem(
        activeIcon: active,
        inactiveIcon: inactive,
        label: label,
        isSelected: currentIndex == i,
        onTap: () => onTap(i),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _tab(0, Icons.home_rounded, Icons.home_outlined, 'Home'),
        _tab(1, Icons.explore_rounded, Icons.explore_outlined, 'Explore'),
        Expanded(
          child: CitizenBottomNavCenterButton(
            isSelected: currentIndex == 2,
            onTap: () => onTap(2),
          ),
        ),
        _tab(
          3,
          Icons.assignment_rounded,
          Icons.assignment_outlined,
          'My Issues',
        ),
        _tab(4, Icons.person_rounded, Icons.person_outline_rounded, 'Profile'),
      ],
    );
  }
}
