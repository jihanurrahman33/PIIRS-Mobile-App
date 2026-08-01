import 'package:flutter/material.dart';

import '../errors/failures.dart';

/// Reusable Error Feedback View with retry button callback.
class ErrorView extends StatelessWidget {
  final String title;
  final String message;
  final IconData icon;
  final VoidCallback? onRetry;

  const ErrorView({
    super.key,
    this.title = 'Something went wrong',
    required this.message,
    this.icon = Icons.error_outline_rounded,
    this.onRetry,
  });

  /// Factory constructor constructing [ErrorView] directly from a domain [Failure].
  factory ErrorView.fromFailure(Failure failure, {VoidCallback? onRetry}) {
    if (failure is NetworkFailure) {
      return ErrorView(
        title: 'Connection Issue',
        message: failure.message,
        icon: Icons.wifi_off_rounded,
        onRetry: onRetry,
      );
    }
    if (failure is UnauthorizedFailure) {
      return ErrorView(
        title: 'Authentication Required',
        message: failure.message,
        icon: Icons.lock_outline_rounded,
        onRetry: onRetry,
      );
    }
    return ErrorView(
      title: 'Unable to Load Data',
      message: failure.message,
      icon: Icons.error_outline_rounded,
      onRetry: onRetry,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: theme.colorScheme.errorContainer.withValues(alpha: 0.3),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 48,
                color: theme.colorScheme.error,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              title,
              textAlign: TextAlign.center,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              message,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            if (onRetry != null) ...[
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh_rounded),
                label: const Text('Try Again'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
