import 'package:flutter/material.dart';

import '../../../../core/widgets/widgets.dart';

/// Explore Issues Tab Page displaying public issues feed & filters.
class ExploreIssuesPage extends StatelessWidget {
  const ExploreIssuesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore Public Issues'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list_rounded),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.map_rounded),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              AppTextField(
                label: 'Search issues by title or location...',
                prefixIcon: Icons.search_rounded,
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.separated(
                  itemCount: 4,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final titles = [
                      'Deep pothole on Main Street near intersection',
                      'Broken streetlight outside community park',
                      'Damaged sidewalk paving slab on 5th Ave',
                      'Water pipe leakage causing pavement flood',
                    ];
                    final statuses = [
                      'Pending',
                      'In Progress',
                      'Resolved',
                      'Boosted'
                    ];

                    return AppCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              StatusBadge(status: statuses[index]),
                              Text(
                                '${(index + 1) * 3} upvotes',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            titles[index],
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Reported 2 days ago • Sector 4',
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurfaceVariant,
                                    ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
