import 'package:flutter/material.dart';

import '../widgets/explore_filter_header.dart';
import '../widgets/explore_issue_card.dart';

/// Explore Issues Tab Page displaying Stitch-styled public issues feed.
class ExploreIssuesPage extends StatefulWidget {
  const ExploreIssuesPage({super.key});

  @override
  State<ExploreIssuesPage> createState() => _ExploreIssuesPageState();
}

class _ExploreIssuesPageState extends State<ExploreIssuesPage> {
  String _selectedStatus = 'All Status';
  bool _isMapView = false;

  static const _issues = [
    (
      title: 'Broken storm drain causing sidewalk flooding',
      location: 'Corner of 5th Ave & Pine St',
      priority: 'HIGH',
      status: 'In Progress',
      reporter: 'Citizen • 4h ago',
      id: 'ZS-8842',
      upvotes: 42,
      comments: 8,
    ),
    (
      title: 'Pedestrian crossing light stuck on red cycle',
      location: 'Oak Street & MLK Blvd',
      priority: 'URGENT',
      status: 'Pending',
      reporter: 'Sarah M. • 1h ago',
      id: 'ZS-8901',
      upvotes: 89,
      comments: 15,
    ),
    (
      title: 'Deep pothole on Main Street near intersection',
      location: 'Sector 4',
      priority: 'HIGH',
      status: 'Resolved',
      reporter: 'David K. • Yesterday',
      id: 'ZS-8790',
      upvotes: 24,
      comments: 6,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Explore Public Issues')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            ExploreFilterHeader(
              selectedStatus: _selectedStatus,
              onStatusSelected: (s) => setState(() => _selectedStatus = s),
              isMapView: _isMapView,
              onViewToggle: (v) => setState(() => _isMapView = v),
            ),
            const SizedBox(height: 16),
            ..._issues.map(
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
