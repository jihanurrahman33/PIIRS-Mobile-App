import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../home/presentation/widgets/home_post_skeleton_list.dart';
import '../bloc/explore_filter_bloc.dart';
import '../bloc/issue_bloc.dart';
import '../bloc/issue_state.dart';
import '../models/sample_explore_issues.dart';
import '../utils/explore_issue_filter.dart';
import 'explore_issue_card.dart';
import 'explore_real_issue_card.dart';

/// List section displaying public civic issue reports on the explore feed.
class ExploreIssuesListSection extends StatelessWidget {
  const ExploreIssuesListSection({super.key});

  @override
  Widget build(BuildContext context) {
    String st = 'All Status';
    try {
      st = context.watch<ExploreFilterBloc>().state.selectedStatus;
    } catch (_) {}

    IssueState? state;
    try {
      state = context.watch<IssueBloc>().state;
    } catch (_) {}

    if (state is IssueLoadingState) return const HomePostSkeletonList(count: 3);

    if (state is IssuesLoadedState && state.issues.isNotEmpty) {
      final items = ExploreIssueFilter.filter(state.issues, st);
      return Column(
        children: items
            .map(
              (issue) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: ExploreRealIssueCard(issue: issue),
              ),
            )
            .toList(),
      );
    }

    return Column(
      children: SampleExploreIssues.items
          .map(
            (i) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: ExploreIssueCard(
                title: i.title,
                location: i.location,
                priority: i.priority,
                status: i.status,
                reporter: i.reporter,
                id: i.id,
                upvotes: i.upvotes,
                comments: i.comments,
                onTap: () => context.push('/issues/details/101'),
              ),
            ),
          )
          .toList(),
    );
  }
}
