import 'package:flutter/material.dart';

import 'onboarding_dot_indicator.dart';

/// Footer controls combining pagination dots with next/get-started button.
class OnboardingFooterControls extends StatelessWidget {
  final int count;
  final int currentIndex;
  final bool isLastPage;
  final VoidCallback onNext;

  const OnboardingFooterControls({
    super.key,
    required this.count,
    required this.currentIndex,
    required this.isLastPage,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          OnboardingDotIndicator(count: count, currentIndex: currentIndex),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(140, 52),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
            onPressed: onNext,
            child: Text(isLastPage ? 'Get Started' : 'Next'),
          ),
        ],
      ),
    );
  }
}
