import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

/// Tier progression banner card displaying points needed for Platinum status.
class CitizenNextTierCard extends StatelessWidget {
  const CitizenNextTierCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primarySeed,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Next Tier Level: Platinum Guardian',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Icon(Icons.military_tech_rounded, color: Colors.amber, size: 24),
            ],
          ),
          SizedBox(height: 8),
          Text(
            'Just 160 points remaining to unlock priority municipal review badges.',
            style: TextStyle(color: Colors.white70, fontSize: 12),
          ),
          SizedBox(height: 12),
          LinearProgressIndicator(
            value: 0.84,
            backgroundColor: Colors.white24,
            color: Colors.white,
          ),
          SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '840 pts',
                style: TextStyle(color: Colors.white70, fontSize: 11),
              ),
              Text(
                'Target: 1,000 pts',
                style: TextStyle(color: Colors.white70, fontSize: 11),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
