import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/app_card.dart';

/// Settings options card for upgrading to premium, preferences, and sign out.
class ProfileSettingsListCard extends StatelessWidget {
  const ProfileSettingsListCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        children: [
          ListTile(
            leading: const Icon(
              Icons.insights_rounded,
              color: AppColors.primarySeed,
            ),
            title: const Text(
              'My Civic Impact & Badges',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            subtitle: const Text(
              'Impact score, tier rankings & badges',
              style: TextStyle(fontSize: 11),
            ),
            trailing: const Icon(Icons.chevron_right_rounded),
            onTap: () => context.push('/citizen-dashboard/statistics'),
          ),
          const Divider(color: AppColors.borderLight),
          ListTile(
            leading: const Icon(Icons.star_rounded, color: Colors.amber),
            title: const Text(
              'Upgrade to Premium',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            subtitle: const Text(
              'Priority inspection & direct staff chat',
              style: TextStyle(fontSize: 11),
            ),
            trailing: const Icon(Icons.chevron_right_rounded),
            onTap: () => context.push('/premium'),
          ),
          const Divider(color: AppColors.borderLight),
          ListTile(
            leading: const Icon(
              Icons.notifications_rounded,
              color: AppColors.primarySeed,
            ),
            title: const Text(
              'Notification Preferences',
              style: TextStyle(fontSize: 14),
            ),
            trailing: const Icon(Icons.chevron_right_rounded),
            onTap: () {},
          ),
          const Divider(color: AppColors.borderLight),
          ListTile(
            leading: const Icon(
              Icons.logout_rounded,
              color: AppColors.rejected,
            ),
            title: const Text(
              'Sign Out',
              style: TextStyle(fontSize: 14, color: AppColors.rejected),
            ),
            onTap: () => context.go('/login'),
          ),
        ],
      ),
    );
  }
}
