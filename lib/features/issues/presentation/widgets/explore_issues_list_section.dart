import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'explore_issue_card.dart';

/// List section displaying public civic issue reports on the explore feed.
class ExploreIssuesListSection extends StatelessWidget {
  const ExploreIssuesListSection({super.key});

  static const _issues = [
    (
      title: 'Broken storm drain causing sidewalk flooding',
      location: 'Corner of 5th Ave & Pine St',
      priority: 'HIGH',
      status: 'In Progress',
      reporter: 'Citizen • 4h ago',
      id: 'PIIRS-8842',
      upvotes: 42,
      comments: 8,
    ),
    (
      title: 'Pedestrian crossing light stuck on red cycle',
      location: 'Oak Street & MLK Blvd',
      priority: 'URGENT',
      status: 'Pending',
      reporter: 'Sarah M. • 1h ago',
      id: 'PIIRS-8901',
      upvotes: 89,
      comments: 15,
    ),
    (
      title: 'Deep pothole on Main Street near intersection',
      location: 'Sector 4',
      priority: 'HIGH',
      status: 'Resolved',
      reporter: 'David K. • Yesterday',
      id: 'PIIRS-8790',
      upvotes: 24,
      comments: 6,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _issues
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
