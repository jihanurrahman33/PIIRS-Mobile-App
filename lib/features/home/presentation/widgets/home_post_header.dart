import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/status_badge.dart';

/// Post header displaying reporter avatar, name, location, time, and status badge.
class HomePostHeader extends StatelessWidget {
  final String reporterName;
  final String location;
  final String timeAgo;
  final String status;
  final String? avatarUrl;

  const HomePostHeader({
    super.key,
    required this.reporterName,
    required this.location,
    required this.timeAgo,
    required this.status,
    this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 18,
          backgroundImage: (avatarUrl != null && avatarUrl!.startsWith('http'))
              ? NetworkImage(avatarUrl!)
              : const AssetImage('assets/stitch/03_alex_portrait_headshot.png')
                    as ImageProvider,
          onBackgroundImageError: (_, _) {},
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    reporterName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Icon(
                    Icons.verified_rounded,
                    size: 14,
                    color: AppColors.primarySeed,
                  ),
                ],
              ),
              Text(
                '$location • $timeAgo',
                style: const TextStyle(
                  fontSize: 11,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
        StatusBadge(status: status),
      ],
    );
  }
}
