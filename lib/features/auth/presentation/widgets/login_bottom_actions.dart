import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/app_button.dart';
import 'social_auth_buttons.dart';

/// Bottom actions section for login including submit button, social logins, and sign up.
class LoginBottomActions extends StatelessWidget {
  final VoidCallback onLogin;
  final bool isLoading;

  const LoginBottomActions({
    super.key,
    required this.onLogin,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppButton(
          text: 'Sign In',
          isLoading: isLoading,
          onPressed: isLoading ? null : onLogin,
        ),
        const SizedBox(height: 8),
        TextButton(
          onPressed: () => context.go('/home'),
          child: const Text('Continue as Guest'),
        ),
        const SizedBox(height: 16),
        const SocialAuthButtons(),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Don't have an account? ", style: theme.textTheme.bodyMedium),
            GestureDetector(
              onTap: () => context.push('/register'),
              child: Text(
                'Sign Up',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
