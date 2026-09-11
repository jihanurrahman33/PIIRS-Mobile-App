import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import 'home_post_upvote_button.dart';

/// Interactive social actions bar for issue posts (upvote, comment, share).
class HomePostActions extends StatelessWidget {
  final int initialUpvotes;
  final int commentCount;
  final VoidCallback? onCommentTap;
  final VoidCallback? onShareTap;

  const HomePostActions({
    super.key,
    required this.initialUpvotes,
    required this.commentCount,
    this.onCommentTap,
    this.onShareTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HomePostUpvoteButton(initialUpvotes: initialUpvotes),
        InkWell(
          onTap: onCommentTap,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              children: [
                const Icon(
                  Icons.chat_bubble_outline_rounded,
                  size: 15,
                  color: AppColors.textSecondary,
                ),
                const SizedBox(width: 4),
                Text(
                  '$commentCount comments',
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.share_outlined, size: 18),
          color: AppColors.textSecondary,
          onPressed: onShareTap,
          constraints: const BoxConstraints(),
          padding: EdgeInsets.zero,
        ),
      ],
    );
  }
}
