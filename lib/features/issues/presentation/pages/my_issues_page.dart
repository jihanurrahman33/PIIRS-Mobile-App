import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/my_issues_header_widget.dart';
import '../widgets/my_issues_status_card.dart';

/// My Issues Tab Page reflecting Stitch status hub design.
class MyIssuesPage extends StatefulWidget {
  const MyIssuesPage({super.key});

  @override
  State<MyIssuesPage> createState() => _MyIssuesPageState();
}

class _MyIssuesPageState extends State<MyIssuesPage> {
  String _selectedTab = 'All';

  static const _tabs = [
    'All',
    'In Progress',
    'Pending',
    'Resolved',
    'Rejected',
  ];

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
    return Scaffold(
      appBar: AppBar(title: const Text('My Reported Issues')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const MyIssuesHeaderWidget(),
            const SizedBox(height: 14),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _tabs
                    .map(
                      (tab) => Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ChoiceChip(
                          label: Text(tab),
                          selected: _selectedTab == tab,
                          onSelected: (_) => setState(() => _selectedTab = tab),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            const SizedBox(height: 14),
            ..._myIssues.map(
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
            ),
          ],
        ),
      ),
    );
  }
}
