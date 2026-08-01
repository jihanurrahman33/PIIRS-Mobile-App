import 'package:flutter/material.dart';

import '../theme/app_theme_extensions.dart';

/// Reusable status badge pill displaying status tag with StatusColors.
class StatusBadge extends StatelessWidget {
  final String status;

  const StatusBadge({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final statusColors = Theme.of(context).extension<StatusColors>();
    final normalized = status.toLowerCase().replaceAll(' ', '');

    Color color;
    switch (normalized) {
      case 'inprogress':
        color = statusColors?.inProgress ?? Colors.blue;
        break;
      case 'resolved':
        color = statusColors?.resolved ?? Colors.green;
        break;
      case 'rejected':
        color = statusColors?.rejected ?? Colors.red;
        break;
      case 'boosted':
        color = statusColors?.boosted ?? Colors.purple;
        break;
      case 'pending':
      default:
        color = statusColors?.pending ?? Colors.orange;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: color.withValues(alpha: 0.3),
          width: 1.0,
        ),
      ),
      child: Text(
        status.toUpperCase(),
        style: TextStyle(
          color: color,
          fontSize: 11.0,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
