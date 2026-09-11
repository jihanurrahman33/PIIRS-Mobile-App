import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

/// 4-segment priority selector component from Stitch design.
class ReportPrioritySelectorWidget extends StatelessWidget {
  final String selectedPriority;
  final ValueChanged<String> onPriorityChanged;

  const ReportPrioritySelectorWidget({
    super.key,
    required this.selectedPriority,
    required this.onPriorityChanged,
  });

  static const _priorities = ['Low', 'Normal', 'High', 'Urgent'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Priority Level',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
            Text(
              selectedPriority == 'Urgent'
                  ? 'Critical safety hazard'
                  : 'Standard review',
              style: TextStyle(
                fontSize: 11,
                color: selectedPriority == 'Urgent'
                    ? AppColors.priorityUrgent
                    : AppColors.textMuted,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: AppColors.surfaceContainerLow,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: _priorities.map((p) => _buildOption(p)).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildOption(String priority) {
    final isSelected = selectedPriority == priority;
    final color = priority == 'Urgent'
        ? AppColors.priorityUrgent
        : AppColors.primarySeed;

    return Expanded(
      child: InkWell(
        onTap: () => onPriorityChanged(priority),
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? color : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              priority,
              style: TextStyle(
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected ? Colors.white : AppColors.textSecondary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
