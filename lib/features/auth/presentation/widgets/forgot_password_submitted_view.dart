import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/widgets.dart';
import '../bloc/countdown_timer_bloc.dart';

/// Confirmation screen displayed after password reset link has been dispatched.
class ForgotPasswordSubmittedView extends StatelessWidget {
  final String email;
  final VoidCallback onResend;

  const ForgotPasswordSubmittedView({
    super.key,
    required this.email,
    required this.onResend,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const AppHeader(
          title: 'Check Your Email',
          icon: Icons.mark_email_read_rounded,
          iconColor: AppColors.resolved,
        ),
        const SizedBox(height: 12),
        Text(
          'We have sent a password reset link to $email',
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 32),
        BlocBuilder<CountdownTimerBloc, int>(
          builder: (context, seconds) {
            if (seconds > 0) {
              return Text(
                'Resend email in ${seconds}s',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w600,
                ),
              );
            }
            return TextButton(
              onPressed: onResend,
              child: const Text('Resend Reset Link'),
            );
          },
        ),
        const SizedBox(height: 16),
        AppOutlinedButton(
          text: 'Back to Sign In',
          onPressed: () => context.pop(),
        ),
      ],
    );
  }
}
