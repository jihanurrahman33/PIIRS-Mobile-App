import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';

/// Account status notice screen for blocked or pending user accounts.
class AccountBlockedPage extends StatelessWidget {
  final bool isBlocked;
  final String reason;

  const AccountBlockedPage({
    super.key,
    this.isBlocked = true,
    this.reason =
        'Your account has been temporarily restricted by system administrators due to policy review.',
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final accentColor = isBlocked ? AppColors.rejected : AppColors.pending;
    final title = isBlocked ? 'Account Blocked' : 'Account Under Review';
    final icon =
        isBlocked ? Icons.block_rounded : Icons.hourglass_empty_rounded;

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
                    color: accentColor.withValues(alpha: 0.15),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icon,
                    size: 48,
                    color: accentColor,
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
                reason,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                onPressed: () {
                  // Trigger support contact or mailto
                },
                icon: const Icon(Icons.support_agent_rounded),
                label: const Text('Contact Support'),
              ),
              const SizedBox(height: 12),
              OutlinedButton(
                onPressed: () => context.go('/login'),
                child: const Text('Return to Sign In'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
