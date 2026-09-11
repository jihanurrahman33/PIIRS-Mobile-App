import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

/// Header icon and title for email verification pending state.
class EmailVerificationHeader extends StatelessWidget {
  final String email;

  const EmailVerificationHeader({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: AppColors.inProgress.withValues(alpha: 0.15),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.mark_email_unread_rounded,
            size: 44,
            color: AppColors.inProgress,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Verify Your Email',
          textAlign: TextAlign.center,
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'We have sent a verification email to:\n$email',
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
