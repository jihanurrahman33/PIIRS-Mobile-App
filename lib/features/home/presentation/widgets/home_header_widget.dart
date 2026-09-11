import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

/// Top citizen location ribbon and warm greeting header from Stitch UI.
class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [_buildLocationPill(), _buildGridLiveBadge()],
        ),
        const SizedBox(height: 12),
        const Text(
          'Good morning, Alex 👋',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 4),
        const Row(
          children: [
            Icon(Icons.verified_rounded, size: 16, color: AppColors.resolved),
            SizedBox(width: 4),
            Text(
              '2 issues resolved in your area this week',
              style: TextStyle(fontSize: 13, color: AppColors.textSecondary),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildLocationPill() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.location_on_rounded,
            size: 14,
            color: AppColors.primarySeed,
          ),
          SizedBox(width: 4),
          Text(
            'Downtown Ward 4',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          ),
          Icon(
            Icons.keyboard_arrow_down_rounded,
            size: 16,
            color: AppColors.textSecondary,
          ),
        ],
      ),
    );
  }

  Widget _buildGridLiveBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.circle, size: 8, color: AppColors.resolved),
          SizedBox(width: 4),
          Text(
            'GRID LIVE',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: AppColors.primarySeed,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
