import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import 'issue_resolution_step_item.dart';

/// 5-step vertical resolution progress stepper widget with active indicator.
class IssueResolutionStepperWidget extends StatelessWidget {
  final VoidCallback onViewFullTimeline;

  const IssueResolutionStepperWidget({
    super.key,
    required this.onViewFullTimeline,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: theme.colorScheme.outlineVariant.withValues(alpha: 0.5),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Resolution Timeline', style: theme.textTheme.titleMedium),
              TextButton(
                onPressed: onViewFullTimeline,
                child: const Text('View All'),
              ),
            ],
          ),
          const IssueResolutionStepItem(
            icon: Icons.check_circle_rounded,
            color: AppColors.resolved,
            title: 'Report Submitted',
            time: '08:30 AM',
          ),
          const SizedBox(height: 8),
          const IssueResolutionStepItem(
            icon: Icons.check_circle_rounded,
            color: AppColors.resolved,
            title: 'Verified by Staff',
            time: '09:15 AM',
          ),
          const SizedBox(height: 8),
          const IssueResolutionStepItem(
            icon: Icons.sync_rounded,
            color: AppColors.inProgress,
            title: 'Crew Dispatched (ACTIVE)',
            time: '10:00 AM • 1.4 mi',
          ),
        ],
      ),
    );
  }
}
