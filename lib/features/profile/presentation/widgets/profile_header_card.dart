import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../auth/domain/entities/user_entity.dart';
import 'profile_civic_badge.dart';

/// Profile header card showing user avatar, name, email, and civic standing badge.
class ProfileHeaderCard extends StatelessWidget {
  final UserEntity? user;
  const ProfileHeaderCard({super.key, this.user});

  ImageProvider _avatarProvider() {
    final url = user?.avatarUrl;
    if (url != null && url.startsWith('http')) return NetworkImage(url);
    return const AssetImage('assets/stitch/03_alex_portrait_headshot.png');
  }

  @override
  Widget build(BuildContext context) {
    final name = (user != null && user!.name.trim().isNotEmpty)
        ? user!.name
        : 'Citizen User';
    final email = (user != null && user!.email.trim().isNotEmpty)
        ? user!.email
        : 'alex.morgan@example.com';

    return AppCard(
      child: Column(
        children: [
          CircleAvatar(
            radius: 36,
            backgroundImage: _avatarProvider(),
            onBackgroundImageError: (_, _) {},
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (user?.isVerified == true) ...[
                const SizedBox(width: 4),
                const Icon(
                  Icons.verified_rounded,
                  size: 16,
                  color: AppColors.primarySeed,
                ),
              ],
            ],
          ),
          Text(
            email,
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 8),
          ProfileCivicBadge(user: user),
        ],
      ),
    );
  }
}
