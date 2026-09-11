import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../auth/presentation/bloc/auth_event.dart';
import 'profile_premium_tile.dart';

/// Settings options card for upgrading to premium, preferences, and sign out.
class ProfileSettingsListCard extends StatelessWidget {
  final UserEntity? user;
  const ProfileSettingsListCard({super.key, this.user});

  void _onSignOut(BuildContext context) {
    try {
      context.read<AuthBloc>().add(const LogoutRequestedEvent());
    } catch (_) {}
    context.go('/login');
  }

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
          ListTile(
            leading: const Icon(
              Icons.logout_rounded,
              color: AppColors.rejected,
            ),
            title: const Text(
              'Sign Out',
              style: TextStyle(fontSize: 14, color: AppColors.rejected),
            ),
            onTap: () => _onSignOut(context),
          ),
        ],
      ),
    );
  }
}
