import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'home_recent_report_card.dart';

/// Recent community reports section for the citizen home dashboard.
class HomeRecentReportsSection extends StatelessWidget {
  const HomeRecentReportsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Recent Community Reports',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        HomeRecentReportCard(
          title: 'Deep pothole on Main Street near intersection',
          location: 'Sector 4',
          status: 'In Progress',
          upvotes: 12,
          timeAgo: '2 hours ago',
          onTap: () => context.push('/issues/details/101'),
        ),
      ],
    );
  }
}
