import 'package:flutter/material.dart';

/// Single horizontal row displaying a step icon, label, and timestamp.
class IssueResolutionStepItem extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String time;

  const IssueResolutionStepItem({
    super.key,
    required this.icon,
    required this.color,
    required this.title,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Icon(icon, size: 20, color: color),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: theme.textTheme.labelLarge),
              Text(
                time,
                style: TextStyle(
                  fontSize: 11,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
