import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

/// Interactive action footer for Explore issue cards (upvote, comments, share).
class ExploreCardActions extends StatelessWidget {
  final int upvotes;
  final int comments;
  final VoidCallback? onUpvote;

  const ExploreCardActions({
    super.key,
    required this.upvotes,
    required this.comments,
    this.onUpvote,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton.icon(
          onPressed: onUpvote ?? () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primarySeed,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          ),
          icon: const Icon(Icons.arrow_upward_rounded, size: 14),
          label: Text(
            'Upvote ($upvotes)',
            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
          ),
        ),
        Text(
          '💬 $comments',
          style: const TextStyle(fontSize: 11, color: AppColors.textSecondary),
        ),
        const Icon(
          Icons.share_outlined,
          size: 18,
          color: AppColors.textSecondary,
        ),
      ],
    );
  }
}
