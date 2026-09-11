import 'package:flutter/material.dart';

import '../../../../core/widgets/app_card.dart';

/// Grid presentation displaying citizen earned and locked civic badges.
class CivicBadgesShowcaseWidget extends StatelessWidget {
  const CivicBadgesShowcaseWidget({super.key});

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
              Text(
                'Achievement Badges',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                '4 of 8 Unlocked',
                style: TextStyle(fontSize: 11, color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildBadgeItem(
            '🌟 First Responder',
            'Logged priority alert in 10 min',
          ),
          const Divider(height: 16),
          _buildBadgeItem(
            '🛡️ Neighborhood Hero',
            '250+ community endorsements',
          ),
          const Divider(height: 16),
          _buildBadgeItem(
            '🚜 Pothole Hunter',
            '5 road surface repairs verified',
          ),
          const Divider(height: 16),
          _buildBadgeItem('👑 Civic Legend', 'Attained Level 3 civic standing'),
        ],
      ),
    );
  }

  Widget _buildBadgeItem(String title, String desc) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                desc,
                style: const TextStyle(fontSize: 11, color: Colors.grey),
              ),
            ],
          ),
        ),
        const Icon(Icons.check_circle_rounded, size: 18, color: Colors.green),
      ],
    );
  }
}
