import 'package:flutter/material.dart';

import '../../../../core/widgets/app_card.dart';

/// Location snippet card displaying incident coordinates and maps action.
class IssueLocationSnippetWidget extends StatelessWidget {
  final VoidCallback onOpenMap;

  const IssueLocationSnippetWidget({super.key, required this.onOpenMap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.location_on_rounded,
                    color: theme.colorScheme.primary,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Incident Location',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              TextButton.icon(
                onPressed: onOpenMap,
                icon: const Icon(Icons.open_in_new_rounded, size: 16),
                label: const Text('Open Map'),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            'Elm St & 4th Ave • Ward 4',
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            'GPS: 43.6532° N, 79.3832° W',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
