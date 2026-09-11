import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

/// 3-column key civic metrics row showing issues reported, resolved, and upvotes.
class CitizenStatsMetricsRow extends StatelessWidget {
  const CitizenStatsMetricsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildItem(
          context,
          Icons.report_rounded,
          AppColors.primarySeed,
          '15',
          'Reported',
        ),
        const SizedBox(width: 8),
        _buildItem(
          context,
          Icons.check_circle_rounded,
          AppColors.resolved,
          '12',
          'Resolved (80%)',
        ),
        const SizedBox(width: 8),
        _buildItem(
          context,
          Icons.local_fire_department_rounded,
          Colors.orange,
          '340',
          'Upvotes',
        ),
      ],
    );
  }

  Widget _buildItem(
    BuildContext ctx,
    IconData icon,
    Color color,
    String val,
    String lbl,
  ) {
    final theme = Theme.of(ctx);

    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: theme.colorScheme.outlineVariant.withValues(alpha: 0.5),
          ),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 22),
            const SizedBox(height: 6),
            Text(
              val,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(lbl, style: const TextStyle(fontSize: 10, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
