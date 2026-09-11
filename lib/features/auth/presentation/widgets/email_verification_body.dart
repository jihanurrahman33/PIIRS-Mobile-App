import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/countdown_timer_bloc.dart';
import 'email_verification_header.dart';

/// Body layout for email verification pending state.
class EmailVerificationBody extends StatelessWidget {
  final String email;
  final VoidCallback onCheckVerification;
  final VoidCallback onResend;

  const EmailVerificationBody({
    super.key,
    required this.email,
    required this.onCheckVerification,
    required this.onResend,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            EmailVerificationHeader(email: email),
            const SizedBox(height: 36),
            ElevatedButton(
              onPressed: onCheckVerification,
              child: const Text("I've Verified My Email"),
            ),
            const SizedBox(height: 12),
            BlocBuilder<CountdownTimerBloc, int>(
              builder: (context, seconds) => seconds > 0
                  ? Text(
                      'Resend verification email in ${seconds}s',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    )
                  : OutlinedButton(
                      onPressed: onResend,
                      child: const Text('Resend Verification Email'),
                    ),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () => context.go('/login'),
              child: const Text('Back to Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}
