import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/app_card.dart';
import 'home_summary_item.dart';

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
      onTap: () => context.push('/citizen-dashboard/statistics'),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          HomeSummaryItem(
            label: 'Total Reports',
            val: '$totalReported',
            icon: Icons.assignment_outlined,
            color: AppColors.primarySeed,
          ),
          Container(height: 36, width: 1, color: AppColors.borderLight),
          HomeSummaryItem(
            label: 'In Progress',
            val: '$inProgress',
            icon: Icons.pending_actions_rounded,
            color: AppColors.inProgress,
          ),
          Container(height: 36, width: 1, color: AppColors.borderLight),
          HomeSummaryItem(
            label: 'Resolved',
            val: '$resolved',
            icon: Icons.task_alt_rounded,
            color: AppColors.resolved,
          ),
        ],
      ),
    );
  }
}
