import 'package:flutter/material.dart';

import '../widgets/issue_list_card.dart';

/// Sub-view listing user's pending issue reports awaiting assignment.
class PendingIssuesPage extends StatelessWidget {
  const PendingIssuesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pending Reports'),
      ),
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.all(16.0),
          itemCount: 2,
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            return IssueListCard(
              title: 'Pending issue report #${index + 1}',
              category: 'Water & Sewage',
              status: 'Pending',
              upvotes: 4,
              timeAgo: '1d ago',
            );
          },
        ),
      ),
    );
  }
}
