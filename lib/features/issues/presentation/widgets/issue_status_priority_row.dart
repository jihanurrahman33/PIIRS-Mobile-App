import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/status_badge.dart';

/// Row displaying current status, priority badge, and relative update time.
class IssueStatusPriorityRow extends StatelessWidget {
  final String status;
  final String priority;
  final String updatedTime;

  const IssueStatusPriorityRow({
    super.key,
    required this.status,
    required this.priority,
    required this.updatedTime,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            StatusBadge(status: status),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.rejected.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.warning_rounded,
                    size: 14,
                    color: AppColors.rejected,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    priority.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: AppColors.rejected,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Text(
          updatedTime,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
