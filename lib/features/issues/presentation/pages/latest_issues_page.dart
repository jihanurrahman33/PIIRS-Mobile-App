import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/issue_list_card.dart';

/// Screen listing latest chronologically reported issues.
class LatestIssuesPage extends StatelessWidget {
  const LatestIssuesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Latest Issues Feed'),
      ),
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.all(16.0),
          itemCount: 3,
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            return IssueListCard(
              title: 'Freshly reported problem #${index + 1}',
              category: 'Roads & Potholes',
              status: 'Pending',
              upvotes: index + 1,
              timeAgo: '${(index + 1) * 10}m ago',
              onTap: () => context.push('/issues/details/latest_$index'),
            );
          },
        ),
      ),
    );
  }
}
