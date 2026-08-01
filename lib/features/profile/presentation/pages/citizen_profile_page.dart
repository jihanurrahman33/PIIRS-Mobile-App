import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/widgets.dart';

/// Citizen Profile Tab Page with account details & settings.
class CitizenProfilePage extends StatelessWidget {
  const CitizenProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_rounded),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              AppCard(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor:
                          AppColors.primarySeed.withValues(alpha: 0.15),
                      child: const Icon(
                        Icons.person_rounded,
                        size: 48,
                        color: AppColors.primarySeed,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Citizen User',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'citizen@zapshift.com',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Chip(
                      label: const Text('Standard Citizen'),
                      backgroundColor:
                          AppColors.primarySeed.withValues(alpha: 0.1),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              AppCard(
                child: Column(
                  children: [
                    ListTile(
                      leading:
                          const Icon(Icons.star_rounded, color: Colors.amber),
                      title: const Text('Upgrade to Premium'),
                      subtitle: const Text(
                          'Get priority issue reporting & direct staff chat'),
                      trailing: const Icon(Icons.chevron_right_rounded),
                      onTap: () {},
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(Icons.notifications_rounded),
                      title: const Text('Notification Preferences'),
                      trailing: const Icon(Icons.chevron_right_rounded),
                      onTap: () {},
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(Icons.logout_rounded,
                          color: AppColors.rejected),
                      title: const Text('Sign Out',
                          style: TextStyle(color: AppColors.rejected)),
                      onTap: () => context.go('/login'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
