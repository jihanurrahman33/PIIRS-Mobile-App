import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/issue_list_card.dart';

/// Screen listing all public infrastructure issues.
class AllIssuesPage extends StatelessWidget {
  const AllIssuesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Public Issues'),
      ),
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.all(16.0),
          itemCount: 4,
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final sampleTitles = [
              'Deep pothole on Main Street',
              'Broken streetlight outside park',
              'Flooded sidewalk on 5th Ave',
              'Overturned trash bin in Sector 3',
            ];
            final categories = ['Roads', 'Lighting', 'Water', 'Sanitation'];
            final statuses = ['Pending', 'In Progress', 'Resolved', 'Pending'];

            return IssueListCard(
              title: sampleTitles[index],
              category: categories[index],
              status: statuses[index],
              upvotes: (index + 1) * 7,
              timeAgo: '${index + 1}d ago',
              onTap: () => context.push('/issues/details/10$index'),
            );
          },
        ),
      ),
    );
  }
}
