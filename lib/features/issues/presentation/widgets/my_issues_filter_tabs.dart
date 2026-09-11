import 'package:flutter/material.dart';

/// Horizontal scrollable choice chips row for filtering user reported issues.
class MyIssuesFilterTabs extends StatelessWidget {
  final String selectedTab;
  final ValueChanged<String> onTabSelected;

  const MyIssuesFilterTabs({
    super.key,
    required this.selectedTab,
    required this.onTabSelected,
  });

  static const tabs = ['All', 'In Progress', 'Pending', 'Resolved', 'Rejected'];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: tabs
            .map(
              (tab) => Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ChoiceChip(
                  label: Text(tab),
                  selected: selectedTab == tab,
                  onSelected: (_) => onTabSelected(tab),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
