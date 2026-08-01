import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/app_card.dart';

/// Screen displaying detailed citizen statistics, upvotes, & badge achievements.
class CitizenStatisticsPage extends StatelessWidget {
  const CitizenStatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => context.pop(),
        ),
        title: const Text('My Statistics'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppCard(
                child: Column(
                  children: [
                    const Icon(Icons.workspace_premium_rounded,
                        size: 48, color: Colors.amber),
                    const SizedBox(height: 8),
                    Text(
                      'Civic Hero Level 3',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '450 Community Impact Points',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Achievement Badges',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              AppCard(
                child: Column(
                  children: [
                    ListTile(
                      leading: const CircleAvatar(
                          child: Icon(Icons.camera_alt_rounded)),
                      title: const Text('First Reporter'),
                      subtitle:
                          const Text('Logged your first infrastructure issue'),
                    ),
                    const Divider(),
                    ListTile(
                      leading: const CircleAvatar(
                          child: Icon(Icons.thumb_up_rounded)),
                      title: const Text('Community Guardian'),
                      subtitle:
                          const Text('Upvoted over 25 neighborhood reports'),
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
