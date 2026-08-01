import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';

/// App Update Notice Screen displaying version release notes & update trigger.
class AppUpdatePage extends StatelessWidget {
  final String latestVersion;
  final String releaseNotes;
  final bool isForceUpdate;

  const AppUpdatePage({
    super.key,
    this.latestVersion = 'v1.1.0',
    this.releaseNotes = '• Improved live timeline tracking for issue updates\n'
        '• Enhanced offline data sync performance\n'
        '• UI improvements & stability fixes',
    this.isForceUpdate = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Container(
                  width: 88,
                  height: 88,
                  decoration: BoxDecoration(
                    color: AppColors.primarySeed.withValues(alpha: 0.15),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.system_update_rounded,
                    size: 48,
                    color: AppColors.primarySeed,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'New Update Available!',
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Center(
                child: Chip(
                  label: Text('Version $latestVersion'),
                  backgroundColor:
                      theme.colorScheme.primaryContainer.withValues(alpha: 0.5),
                ),
              ),
              const SizedBox(height: 24),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "What's New:",
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        releaseNotes,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                onPressed: () {
                  // Trigger store URL or in-app update flow
                },
                icon: const Icon(Icons.download_rounded),
                label: const Text('Update Now'),
              ),
              if (!isForceUpdate) ...[
                const SizedBox(height: 12),
                OutlinedButton(
                  onPressed: () => context.go('/login'),
                  child: const Text('Maybe Later'),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
