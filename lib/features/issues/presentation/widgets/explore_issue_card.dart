import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/app_card.dart';
import 'explore_card_actions.dart';
import 'explore_card_header.dart';

/// Rich public issue card with priority, status, and upvote action from Stitch.
class ExploreIssueCard extends StatelessWidget {
  final String title;
  final String location;
  final String priority;
  final String status;
  final String reporter;
  final String id;
  final int upvotes;
  final int comments;
  final VoidCallback? onTap;

  const ExploreIssueCard({
    super.key,
    required this.title,
    required this.location,
    required this.priority,
    required this.status,
    required this.reporter,
    required this.id,
    required this.upvotes,
    required this.comments,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ExploreCardHeader(priority: priority, status: status),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const SizedBox(height: 4),
          Text(
            '$location • $reporter',
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            'Ticket #$id',
            style: const TextStyle(fontSize: 11, color: AppColors.textMuted),
          ),
          const Divider(height: 14, color: AppColors.borderLight),
          ExploreCardActions(upvotes: upvotes, comments: comments),
        ],
      ),
    );
  }
}
