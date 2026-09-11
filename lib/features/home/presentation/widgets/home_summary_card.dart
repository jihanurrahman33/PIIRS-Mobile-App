import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extensions/localization_extension.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../issues/presentation/bloc/issue_bloc.dart';
import '../../../issues/presentation/bloc/issue_state.dart';
import 'home_summary_item.dart';

/// Interactive summary KPI metrics row showing real-time issue statistics.
class HomeSummaryCard extends StatelessWidget {
  final int? totalReported;
  final int? inProgress;
  final int? resolved;

  const HomeSummaryCard({
    super.key,
    this.totalReported,
    this.inProgress,
    this.resolved,
  });

  @override
  Widget build(BuildContext context) {
    int total = totalReported ?? 24,
        progress = inProgress ?? 8,
        done = resolved ?? 14;

    if (totalReported == null && inProgress == null && resolved == null) {
      try {
        final state = context.watch<IssueBloc>().state;
        if (state is IssuesLoadedState && state.issues.isNotEmpty) {
          final issues = state.issues;
          total = issues.length;
          int has(String k) =>
              issues.where((i) => i.status.toLowerCase().contains(k)).length;
          progress = has('progress');
          done = has('resolved');
        }
      } catch (_) {}
    }

    final l10n = context.l10n;
    return Row(
      children: [
        Expanded(
          child: HomeSummaryItem(
            label: l10n?.totalReports ?? 'Total Reports',
            val: '$total',
            icon: Icons.assignment_outlined,
            color: AppColors.primarySeed,
            onTap: () => context.push('/issues'),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: HomeSummaryItem(
            label: l10n?.inProgress ?? 'In Progress',
            val: '$progress',
            icon: Icons.pending_actions_rounded,
            color: AppColors.inProgress,
            onTap: () => context.push('/issues'),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: HomeSummaryItem(
            label: l10n?.resolved ?? 'Resolved',
            val: '$done',
            icon: Icons.task_alt_rounded,
            color: AppColors.resolved,
            onTap: () => context.push('/issues'),
          ),
        ),
      ],
    );
  }
}
