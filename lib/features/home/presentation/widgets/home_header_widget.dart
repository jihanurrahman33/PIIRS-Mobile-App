import 'package:flutter/material.dart';

import '../../../../core/extensions/localization_extension.dart';
import '../../../../core/theme/app_colors.dart';
import 'home_location_ribbon.dart';

/// Top citizen location ribbon and greeting header dynamically bound to user.
class HomeHeaderWidget extends StatelessWidget {
  final String? userName;

  const HomeHeaderWidget({super.key, this.userName});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final name = (userName != null && userName!.trim().isNotEmpty)
        ? userName!.trim().split(' ').first
        : (l10n?.welcomeCitizen ?? 'Alex');
    final greeting = l10n != null
        ? '${l10n.goodMorning} $name 👋'
        : 'Good morning, $name 👋';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HomeLocationRibbon(),
        const SizedBox(height: 12),
        Text(
          greeting,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 4),
        const Row(
          children: [
            Icon(Icons.verified_rounded, size: 16, color: AppColors.resolved),
            SizedBox(width: 4),
            Text(
              '2 issues resolved in your area this week',
              style: TextStyle(fontSize: 13, color: AppColors.textSecondary),
            ),
          ],
        ),
      ],
    );
  }
}
