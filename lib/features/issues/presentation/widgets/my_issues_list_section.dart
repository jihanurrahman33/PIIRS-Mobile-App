import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'my_issues_status_card.dart';

/// List section rendering citizen's reported issues cards.
class MyIssuesListSection extends StatelessWidget {
  const MyIssuesListSection({super.key});

  static const _myIssues = [
    (
      title: 'Water Main Leak',
      date: 'Reported Yesterday • 4th Ave & Pine',
      status: 'In Progress',
      dept: 'Water Works Dept',
      prog: 0.5,
    ),
    (
      title: 'Flickering Street Lamp',
      date: 'Reported on Oct 10 • Sector 2',
      status: 'Resolved',
      dept: 'City Lighting',
      prog: 1.0,
    ),
    (
      title: 'Illegal Dumping on Corner',
      date: 'Reported 3 days ago • Oak St',
      status: 'Pending',
      dept: 'Sanitation Dept',
      prog: 0.25,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _myIssues
          .map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: MyIssuesStatusCard(
                title: item.title,
                date: item.date,
                status: item.status,
                department: item.dept,
                progress: item.prog,
                onTap: () => context.push('/issues/details/101'),
              ),
            ),
          )
          .toList(),
    );
  }
}
