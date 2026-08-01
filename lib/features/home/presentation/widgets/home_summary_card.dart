import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/app_card.dart';

/// Dashboard summary card displaying issue statistics metrics.
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
    final theme = Theme.of(context);

    return AppCard(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildMetricItem(
            context,
            label: 'Total Reports',
            value: totalReported.toString(),
            color: theme.colorScheme.primary,
          ),
          Container(
            height: 40,
            width: 1,
            color: theme.colorScheme.outlineVariant,
          ),
          _buildMetricItem(
            context,
            label: 'In Progress',
            value: inProgress.toString(),
            color: AppColors.inProgress,
          ),
          Container(
            height: 40,
            width: 1,
            color: theme.colorScheme.outlineVariant,
          ),
          _buildMetricItem(
            context,
            label: 'Resolved',
            value: resolved.toString(),
            color: AppColors.resolved,
          ),
        ],
      ),
    );
  }

  Widget _buildMetricItem(
    BuildContext context, {
    required String label,
    required String value,
    required Color color,
  }) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value,
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
