import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/app_card.dart';

/// Summary card displaying citizen engagement metrics & impact score.
class CitizenStatsSummaryCard extends StatelessWidget {
  final int totalSubmitted;
  final int totalResolved;
  final int impactPoints;

  const CitizenStatsSummaryCard({
    super.key,
    this.totalSubmitted = 15,
    this.totalResolved = 11,
    this.impactPoints = 450,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppCard(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Citizen Impact Score',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Chip(
                avatar: const Icon(Icons.bolt_rounded,
                    color: Colors.amber, size: 18),
                label: Text('$impactPoints pts'),
                backgroundColor: Colors.amber.withValues(alpha: 0.15),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildMetricColumn(
                context,
                label: 'Reports Filed',
                value: '$totalSubmitted',
                color: theme.colorScheme.primary,
              ),
              _buildMetricColumn(
                context,
                label: 'Fixed by City',
                value: '$totalResolved',
                color: AppColors.resolved,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMetricColumn(
    BuildContext context, {
    required String label,
    required String value,
    required Color color,
  }) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Text(
          value,
          style: theme.textTheme.headlineMedium?.copyWith(
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
