import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/issue_list_card.dart';

/// Screen listing successfully resolved public issues.
class ResolvedIssuesPage extends StatelessWidget {
  const ResolvedIssuesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resolved Issues Feed'),
      ),
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.all(16.0),
          itemCount: 3,
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            return IssueListCard(
              title: 'Repaired infrastructure issue #${index + 1}',
              category: 'Street Lighting',
              status: 'Resolved',
              upvotes: 18 + index * 5,
              timeAgo: '3d ago',
              onTap: () => context.push('/issues/details/resolved_$index'),
            );
          },
        ),
      ),
    );
  }
}
