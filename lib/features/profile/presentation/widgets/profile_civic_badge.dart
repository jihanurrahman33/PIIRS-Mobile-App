import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../auth/domain/entities/user_entity.dart';

/// Pill badge widget displaying user civic tier or system role.
class ProfileCivicBadge extends StatelessWidget {
  final UserEntity? user;
  const ProfileCivicBadge({super.key, this.user});

  String _badgeText() {
    if (user?.isAdmin == true) return 'System Administrator 🛡️';
    if (user?.isStaff == true) return 'Operations Staff 🛠️';
    if (user?.isPremium == true) return 'Civic Hero (Premium Member) ⭐';
    return 'Level 4 Neighborhood Guardian 🛡️';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        _badgeText(),
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          color: AppColors.primarySeed,
        ),
      ),
    );
  }
}
