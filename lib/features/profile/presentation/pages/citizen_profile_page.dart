import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/widgets.dart';

/// Citizen Profile Tab Page conforming to Stitch profile layout under 80 lines.
class CitizenProfilePage extends StatelessWidget {
  const CitizenProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Profile')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            AppCard(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 36,
                    backgroundImage: AssetImage(
                      'assets/stitch/03_alex_portrait_headshot.png',
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Citizen User',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'alex.morgan@example.com',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceContainerLow,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Text(
                      'Level 4 Neighborhood Guardian 🛡️',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primarySeed,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),
            AppCard(
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(
                      Icons.star_rounded,
                      color: Colors.amber,
                    ),
                    title: const Text(
                      'Upgrade to Premium',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: const Text(
                      'Priority inspection & direct staff chat',
                      style: TextStyle(fontSize: 11),
                    ),
                    trailing: const Icon(Icons.chevron_right_rounded),
                    onTap: () {},
                  ),
                  const Divider(color: AppColors.borderLight),
                  ListTile(
                    leading: const Icon(
                      Icons.notifications_rounded,
                      color: AppColors.primarySeed,
                    ),
                    title: const Text(
                      'Notification Preferences',
                      style: TextStyle(fontSize: 14),
                    ),
                    trailing: const Icon(Icons.chevron_right_rounded),
                    onTap: () {},
                  ),
                  const Divider(color: AppColors.borderLight),
                  ListTile(
                    leading: const Icon(
                      Icons.logout_rounded,
                      color: AppColors.rejected,
                    ),
                    title: const Text(
                      'Sign Out',
                      style: TextStyle(fontSize: 14, color: AppColors.rejected),
                    ),
                    onTap: () => context.go('/login'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
