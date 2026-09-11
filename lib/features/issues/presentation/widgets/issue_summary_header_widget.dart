import 'package:flutter/material.dart';

/// Header widget displaying issue title, detailed description, and reporter context.
class IssueSummaryHeaderWidget extends StatelessWidget {
  final String title;
  final String description;
  final String reporterInfo;

  const IssueSummaryHeaderWidget({
    super.key,
    required this.title,
    required this.description,
    required this.reporterInfo,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          description,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          reporterInfo,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.primary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
