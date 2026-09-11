import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'home_app_bar_action_button.dart';

/// Actions bar widget with search and notification action buttons.
class HomeAppBarActions extends StatelessWidget {
  const HomeAppBarActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        HomeAppBarActionButton(
          icon: Icons.search_rounded,
          tooltip: 'Search reports',
          onTap: () => context.push('/search'),
        ),
        const SizedBox(width: 8),
        HomeAppBarActionButton(
          icon: Icons.notifications_outlined,
          tooltip: 'Notifications',
          hasBadge: true,
          onTap: () => context.push('/notifications'),
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}
