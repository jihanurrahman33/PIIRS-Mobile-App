import 'package:flutter/material.dart';

/// Top bar skip action button for onboarding slides.
class OnboardingSkipButton extends StatelessWidget {
  final bool isLastPage;
  final VoidCallback onSkip;

  const OnboardingSkipButton({
    super.key,
    required this.isLastPage,
    required this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (isLastPage) {
      return const SizedBox(height: 48);
    }

    return TextButton(
      onPressed: onSkip,
      child: Text(
        'Skip',
        style: theme.textTheme.titleMedium?.copyWith(
          color: theme.colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }
}
