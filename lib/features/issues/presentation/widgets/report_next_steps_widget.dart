import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/app_card.dart';

/// Next steps milestone timeline preview for newly submitted reports.
class ReportNextStepsWidget extends StatelessWidget {
  const ReportNextStepsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Next Steps',
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Step 1 of 3 complete',
                style: TextStyle(fontSize: 11, color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _item(
            Icons.check_circle_rounded,
            AppColors.resolved,
            'Report Logged',
            'Intake ID created',
          ),
          const SizedBox(height: 10),
          _item(
            Icons.assignment_turned_in_rounded,
            AppColors.inProgress,
            'Municipal Verification',
            'Lead reviews priority (~2h)',
          ),
        ],
      ),
    );
  }

  Widget _item(IconData icon, Color color, String title, String subtitle) {
    return Row(
      children: [
        Icon(icon, size: 20, color: color),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                subtitle,
                style: const TextStyle(fontSize: 11, color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
