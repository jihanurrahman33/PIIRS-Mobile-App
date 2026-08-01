import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/app_snackbar.dart';

/// Email verification pending screen with resend link & verification check triggers.
class EmailVerificationPage extends StatefulWidget {
  final String email;

  const EmailVerificationPage({
    super.key,
    this.email = 'user@example.com',
  });

  @override
  State<EmailVerificationPage> createState() => _EmailVerificationPageState();
}

class _EmailVerificationPageState extends State<EmailVerificationPage> {
  int _timerSeconds = 60;
  Timer? _resendTimer;

  @override
  void initState() {
    super.initState();
    _startResendTimer();
  }

  @override
  void dispose() {
    _resendTimer?.cancel();
    super.dispose();
  }

  void _startResendTimer() {
    setState(() {
      _timerSeconds = 60;
    });
    _resendTimer?.cancel();
    _resendTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timerSeconds > 0) {
        setState(() {
          _timerSeconds--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  void _handleResendEmail() {
    _startResendTimer();
    AppSnackBar.showSuccess(
      context,
      'Verification email resent to ${widget.email}',
    );
  }

  void _handleCheckVerification() {
    AppSnackBar.showSuccess(
      context,
      'Email verified! Redirecting to home...',
    );
    context.go('/home');
  }

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
                'We have sent a verification email to:\n${widget.email}',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Please click the link in your email to activate your ZapShift account.',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.outline,
                ),
              ),
              const SizedBox(height: 36),
              ElevatedButton(
                onPressed: _handleCheckVerification,
                child: const Text("I've Verified My Email"),
              ),
              const SizedBox(height: 12),
              if (_timerSeconds > 0)
                Text(
                  'Resend verification email in ${_timerSeconds}s',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                )
              else
                OutlinedButton(
                  onPressed: _handleResendEmail,
                  child: const Text('Resend Verification Email'),
                ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () => context.go('/login'),
                child: const Text('Back to Sign In'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
