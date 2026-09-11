import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

/// Upvote pill visual container with dynamic highlight and count.
class HomePostUpvotePill extends StatelessWidget {
  final bool isUpvoted;
  final int upvotes;
  final VoidCallback onTap;

  const HomePostUpvotePill({
    super.key,
    required this.isUpvoted,
    required this.upvotes,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = isUpvoted ? AppColors.primarySeed : AppColors.textSecondary;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: isUpvoted
              ? AppColors.surfaceContainerLow
              : AppColors.lightSurface,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isUpvoted
                  ? Icons.thumb_up_alt_rounded
                  : Icons.thumb_up_off_alt_rounded,
              size: 14,
              color: color,
            ),
            const SizedBox(width: 5),
            Text(
              '$upvotes upvotes',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
