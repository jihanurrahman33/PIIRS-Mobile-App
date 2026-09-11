import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/status_badge.dart';

/// Header widget for explore issue card displaying priority and status badges.
class ExploreCardHeader extends StatelessWidget {
  final String priority;
  final String status;

  const ExploreCardHeader({
    super.key,
    required this.priority,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final color = priority == 'URGENT'
        ? AppColors.priorityUrgent
        : AppColors.priorityHigh;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            priority,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ),
        StatusBadge(status: status),
      ],
    );
  }
}
