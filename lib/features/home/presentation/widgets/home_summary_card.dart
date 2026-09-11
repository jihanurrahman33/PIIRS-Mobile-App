import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/app_card.dart';

/// Dashboard summary card displaying issue statistics metrics based on Stitch design.
class HomeSummaryCard extends StatelessWidget {
  final int totalReported;
  final int inProgress;
  final int resolved;

  const HomeSummaryCard({
    super.key,
    this.totalReported = 24,
    this.inProgress = 8,
    this.resolved = 14,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildItem(
            context,
            'Total Reports',
            '$totalReported',
            Icons.assignment_outlined,
            AppColors.primarySeed,
          ),
          Container(height: 36, width: 1, color: AppColors.borderLight),
          _buildItem(
            context,
            'In Progress',
            '$inProgress',
            Icons.pending_actions_rounded,
            AppColors.inProgress,
          ),
          Container(height: 36, width: 1, color: AppColors.borderLight),
          _buildItem(
            context,
            'Resolved',
            '$resolved',
            Icons.task_alt_rounded,
            AppColors.resolved,
          ),
        ],
      ),
    );
  }

  Widget _buildItem(
    BuildContext context,
    String label,
    String val,
    IconData icon,
    Color color,
  ) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 16, color: color),
            const SizedBox(width: 4),
            Text(
              val,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}
