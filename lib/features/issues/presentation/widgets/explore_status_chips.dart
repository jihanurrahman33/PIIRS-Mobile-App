import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

/// Status filter chips row for the Explore feed.
class ExploreStatusChips extends StatelessWidget {
  final String selectedStatus;
  final ValueChanged<String> onStatusSelected;

  const ExploreStatusChips({
    super.key,
    required this.selectedStatus,
    required this.onStatusSelected,
  });

  static const _statuses = [
    'All Status',
    'Pending',
    'In Progress',
    'Resolved',
    'Urgent',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: _statuses.map((st) {
          final isSelected = selectedStatus == st;
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: FilterChip(
              label: Text(st),
              selected: isSelected,
              onSelected: (_) => onStatusSelected(st),
              labelStyle: TextStyle(
                fontSize: 12,
                color: isSelected ? Colors.white : AppColors.textSecondary,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
              backgroundColor: AppColors.lightSurface,
              selectedColor: AppColors.primarySeed,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
