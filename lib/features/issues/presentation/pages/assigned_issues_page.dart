import 'package:flutter/material.dart';

import '../widgets/issue_list_card.dart';

/// Sub-view listing user's issues actively assigned to staff workers.
class AssignedIssuesPage extends StatelessWidget {
  const AssignedIssuesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assigned Issues'),
      ),
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.all(16.0),
          itemCount: 2,
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            return IssueListCard(
              title: 'Staff assigned issue #${index + 1}',
              category: 'Roads & Potholes',
              status: 'In Progress',
              upvotes: 14,
              timeAgo: '2d ago',
            );
          },
        ),
      ),
    );
  }
}
