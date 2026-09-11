import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/app_button.dart';

/// Bottom actions section for registration including submit and login redirect.
class RegisterBottomActions extends StatelessWidget {
  final VoidCallback onSubmit;
  final bool isLoading;

  const RegisterBottomActions({
    super.key,
    required this.onSubmit,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        AppButton(
          text: 'Create Account',
          isLoading: isLoading,
          onPressed: isLoading ? null : onSubmit,
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Already have an account? ',
              style: theme.textTheme.bodyMedium,
            ),
            GestureDetector(
              onTap: () => context.pop(),
              child: Text(
                'Sign In',
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
