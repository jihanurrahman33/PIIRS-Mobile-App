import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../issues/presentation/bloc/issue_bloc.dart';
import '../../../issues/presentation/bloc/issue_state.dart';
import 'home_real_issue_post_card.dart';
import 'home_recent_fallback_list.dart';

/// Recent community reports section for citizen home displaying real posts.
class HomeRecentReportsSection extends StatelessWidget {
  const HomeRecentReportsSection({super.key});

  @override
  Widget build(BuildContext context) {
    IssueState? issueState;
    try {
      issueState = context.watch<IssueBloc>().state;
    } catch (_) {}

    final hasRealIssues =
        issueState is IssuesLoadedState && issueState.issues.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Recent Community Reports',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () => context.push('/issues'),
              child: const Text(
                'View All',
                style: TextStyle(
                  color: AppColors.primarySeed,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        if (hasRealIssues)
          ...issueState.issues
              .take(6)
              .map(
                (issue) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: HomeRealIssuePostCard(issue: issue),
                ),
              )
        else
          const HomeRecentFallbackList(),
      ],
    );
  }
}
