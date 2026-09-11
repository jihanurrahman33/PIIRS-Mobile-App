import 'package:flutter/material.dart';

import '../widgets/explore_filter_header.dart';
import '../widgets/explore_issues_list_section.dart';

/// Explore Issues Tab Page displaying Stitch-styled public issues feed.
class ExploreIssuesPage extends StatefulWidget {
  const ExploreIssuesPage({super.key});

  @override
  State<ExploreIssuesPage> createState() => _ExploreIssuesPageState();
}

class _ExploreIssuesPageState extends State<ExploreIssuesPage> {
  String _selectedStatus = 'All Status';
  bool _isMapView = false;

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
            const ExploreIssuesListSection(),
          ],
        ),
      ),
    );
  }
}
