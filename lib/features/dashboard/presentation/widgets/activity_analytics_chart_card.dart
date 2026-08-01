import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/app_card.dart';

/// Card component displaying monthly activity breakdown analytics.
class ActivityAnalyticsChartCard extends StatelessWidget {
  const ActivityAnalyticsChartCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Monthly Activity Analytics',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Submissions vs Resolutions (Last 6 Months)',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _buildBarGroup(context,
                  month: 'May', submitted: 40, resolved: 30),
              _buildBarGroup(context,
                  month: 'Jun', submitted: 65, resolved: 50),
              _buildBarGroup(context,
                  month: 'Jul', submitted: 85, resolved: 70),
              _buildBarGroup(context,
                  month: 'Aug', submitted: 55, resolved: 45),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBarGroup(
    BuildContext context, {
    required String month,
    required double submitted,
    required double resolved,
  }) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 10,
              height: submitted,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(width: 4),
            Container(
              width: 10,
              height: resolved,
              decoration: BoxDecoration(
                color: AppColors.resolved,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(month, style: theme.textTheme.labelSmall),
      ],
    );
  }
}
