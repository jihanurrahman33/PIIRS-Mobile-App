import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/issue_list_card.dart';

/// Screen listing most upvoted community issues.
class TrendingIssuesPage extends StatelessWidget {
  const TrendingIssuesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trending Issues'),
      ),
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.all(16.0),
          itemCount: 3,
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            return IssueListCard(
              title: 'High priority community issue #${index + 1}',
              category: 'Water & Sewage',
              status: 'In Progress',
              upvotes: (3 - index) * 45,
              timeAgo: '1d ago',
              onTap: () => context.push('/issues/details/trending_$index'),
            );
          },
        ),
      ),
    );
  }
}
