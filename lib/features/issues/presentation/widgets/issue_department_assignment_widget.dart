import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/app_card.dart';

/// Assignment card showing reporter profile and assigned municipal crew.
class IssueDepartmentAssignmentWidget extends StatelessWidget {
  const IssueDepartmentAssignmentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Assigned Municipal Staff',
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(
              backgroundColor: AppColors.primarySeed.withValues(alpha: 0.15),
              child: const Icon(
                Icons.engineering_rounded,
                color: AppColors.primarySeed,
              ),
            ),
            title: const Text('Public Works Dept - Officer R. Miller'),
            subtitle: const Text('Rapid Response Unit • Dispatch #12 en route'),
          ),
        ],
      ),
    );
  }
}
