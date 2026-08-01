import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

/// Eye-catching gradient promo banner advertising citizen premium perks.
class PremiumBannerWidget extends StatelessWidget {
  final VoidCallback? onUpgradeTap;

  const PremiumBannerWidget({
    super.key,
    this.onUpgradeTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primarySeed,
            AppColors.primarySeed.withValues(alpha: 0.8),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: AppColors.primarySeed.withValues(alpha: 0.3),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.star_rounded,
                        color: Colors.amber, size: 20),
                    const SizedBox(width: 6),
                    Text(
                      'ZAPSHIFT PREMIUM',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'Accelerate City Repairs',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Get priority issue escalation & direct staff updates',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            onPressed: onUpgradeTap,
            child: const Text('Upgrade'),
          ),
        ],
      ),
    );
  }
}
