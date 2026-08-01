import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

/// Maintenance Screen displaying system maintenance notice & status refresh.
class MaintenancePage extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback? onRefresh;

  const MaintenancePage({
    super.key,
    this.title = 'System Under Maintenance',
    this.message =
        'We are currently conducting scheduled system upgrades to enhance performance and security. Please try again shortly.',
    this.onRefresh,
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
                  width: 96,
                  height: 96,
                  decoration: BoxDecoration(
                    color: AppColors.pending.withValues(alpha: 0.15),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.engineering_rounded,
                    size: 52,
                    color: AppColors.pending,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                title,
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                message,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                onPressed: onRefresh ?? () {},
                icon: const Icon(Icons.refresh_rounded),
                label: const Text('Check Status'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
