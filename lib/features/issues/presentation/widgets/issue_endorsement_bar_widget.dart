import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

/// Endorsement bar with interactive upvote, boost action, and supporter counter.
class IssueEndorsementBarWidget extends StatelessWidget {
  final int upvotes;
  final bool isUpvoted;
  final VoidCallback onUpvote;
  final VoidCallback onBoost;

  const IssueEndorsementBarWidget({
    super.key,
    required this.upvotes,
    required this.isUpvoted,
    required this.onUpvote,
    required this.onBoost,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: FilledButton.icon(
                  onPressed: onUpvote,
                  icon: Icon(
                    isUpvoted
                        ? Icons.keyboard_arrow_up_rounded
                        : Icons.thumb_up_off_alt_rounded,
                    size: 20,
                  ),
                  label: Text('Upvote ($upvotes)'),
                ),
              ),
              const SizedBox(width: 8),
              OutlinedButton.icon(
                onPressed: onBoost,
                icon: const Icon(
                  Icons.bolt_rounded,
                  size: 18,
                  color: AppColors.boosted,
                ),
                label: const Text('Boost (3x)'),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(
                Icons.people_alt_rounded,
                size: 16,
                color: Colors.grey,
              ),
              const SizedBox(width: 6),
              Text(
                '+42 neighbors supported this report',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
