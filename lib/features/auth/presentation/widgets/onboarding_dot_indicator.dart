import 'package:flutter/material.dart';

/// Animated page dot indicator for OnboardingPage carousel.
class OnboardingDotIndicator extends StatelessWidget {
  final int count;
  final int currentIndex;

  const OnboardingDotIndicator({
    super.key,
    required this.count,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: List.generate(
        count,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: const EdgeInsets.only(right: 6.0),
          width: currentIndex == index ? 24.0 : 8.0,
          height: 8.0,
          decoration: BoxDecoration(
            color: currentIndex == index
                ? theme.colorScheme.primary
                : theme.colorScheme.outlineVariant,
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
      ),
    );
  }
}
