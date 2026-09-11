import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/app_card.dart';

/// Profile header card showing user avatar, name, email, and civic standing badge.
class ProfileHeaderCard extends StatelessWidget {
  const ProfileHeaderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        children: [
          const CircleAvatar(
            radius: 36,
            backgroundImage: AssetImage(
              'assets/stitch/03_alex_portrait_headshot.png',
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Citizen User',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Text(
            'alex.morgan@example.com',
            style: TextStyle(fontSize: 12, color: AppColors.textSecondary),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerLow,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Text(
              'Level 4 Neighborhood Guardian 🛡️',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: AppColors.primarySeed,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
