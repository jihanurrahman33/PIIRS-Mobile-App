import 'package:flutter/material.dart';

import '../../../../core/widgets/widgets.dart';

/// List of filtered search results matching user query.
class SearchIssuesResultsList extends StatelessWidget {
  const SearchIssuesResultsList({super.key});

  static const _sampleTitles = [
    'Pothole near 5th Avenue bakery',
    'Flickering street lamp on Sector 2 park boundary',
    'Water leakage from municipal pipe line',
  ];
  static const _sampleStatuses = ['Pending', 'In Progress', 'Resolved'];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListView.separated(
      padding: const EdgeInsets.all(16.0),
      itemCount: 3,
      separatorBuilder: (_, _) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        return AppCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  StatusBadge(status: _sampleStatuses[index]),
                  Text(
                    'Sector ${index + 1}',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: theme.colorScheme.outline,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                _sampleTitles[index],
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
