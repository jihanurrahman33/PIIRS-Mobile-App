import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/status_badge.dart';

/// Recent community issue card on Home dashboard inspired by Stitch design.
class HomeRecentReportCard extends StatelessWidget {
  final String title;
  final String location;
  final String status;
  final int upvotes;
  final String timeAgo;
  final VoidCallback? onTap;

  const HomeRecentReportCard({
    super.key,
    required this.title,
    required this.location,
    required this.status,
    required this.upvotes,
    required this.timeAgo,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StatusBadge(status: status),
              _buildUpvotePill(),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                size: 14,
                color: AppColors.primarySeed,
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  '$location • $timeAgo',
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildUpvotePill() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.arrow_upward_rounded,
            size: 13,
            color: AppColors.primarySeed,
          ),
          const SizedBox(width: 4),
          Text(
            '$upvotes upvotes',
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: AppColors.primarySeed,
            ),
          ),
        ],
      ),
    );
  }
}
