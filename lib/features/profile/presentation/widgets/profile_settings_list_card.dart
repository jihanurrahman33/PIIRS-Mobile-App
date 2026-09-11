import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../auth/domain/entities/user_entity.dart';
import 'profile_language_tile.dart';
import 'profile_premium_tile.dart';
import 'profile_sign_out_tile.dart';

/// Settings options card for upgrading to premium, preferences, and sign out.
class ProfileSettingsListCard extends StatelessWidget {
  final UserEntity? user;
  const ProfileSettingsListCard({super.key, this.user});

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
          ProfilePremiumTile(isPremium: user?.isPremium ?? false),
          const Divider(color: AppColors.borderLight),
          const ProfileLanguageTile(),
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
            onTap: () => context.push('/notifications'),
          ),
          const Divider(color: AppColors.borderLight),
          const ProfileSignOutTile(),
        ],
      ),
    );
  }
}
