import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/widgets/app_snackbar.dart';

/// Password reset link request screen.
class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  bool _isSubmitted = false;
  int _timerSeconds = 60;
  Timer? _resendTimer;

  @override
  void dispose() {
    _emailController.dispose();
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

  void _handleSendResetLink() {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _isSubmitted = true;
      });
      _startResendTimer();
      AppSnackBar.showSuccess(
        context,
        'Password reset link sent to ${_emailController.text.trim()}',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: _isSubmitted
                ? _buildSubmittedState(theme)
                : _buildRequestForm(theme),
          ),
        ),
      ),
    );
  }

  Widget _buildRequestForm(ThemeData theme) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: AppColors.primarySeed.withValues(alpha: 0.15),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.lock_reset_rounded,
                size: 36,
                color: AppColors.primarySeed,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Reset Password',
            textAlign: TextAlign.center,
            style: theme.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Enter your account email address and we will send you a password reset link.',
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 32),
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.done,
            decoration: const InputDecoration(
              labelText: 'Email Address',
              prefixIcon: Icon(Icons.email_outlined),
            ),
            validator: Validators.validateEmail,
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: _handleSendResetLink,
            child: const Text('Send Reset Link'),
          ),
        ],
      ),
    );
  }

  Widget _buildSubmittedState(ThemeData theme) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Center(
          child: Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: AppColors.resolved.withValues(alpha: 0.15),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.mark_email_read_rounded,
              size: 40,
              color: AppColors.resolved,
            ),
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Check Your Email',
          textAlign: TextAlign.center,
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'We have sent a password reset link to ${_emailController.text.trim()}',
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 32),
        if (_timerSeconds > 0)
          Text(
            'Resend email in ${_timerSeconds}s',
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w600,
            ),
          )
        else
          TextButton(
            onPressed: _handleSendResetLink,
            child: const Text('Resend Reset Link'),
          ),
        const SizedBox(height: 16),
        OutlinedButton(
          onPressed: () => context.pop(),
          child: const Text('Back to Sign In'),
        ),
      ],
    );
  }
}
