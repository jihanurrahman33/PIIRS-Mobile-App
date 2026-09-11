import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/onboarding_data.dart';
import '../bloc/onboarding_bloc.dart';
import '../bloc/onboarding_event.dart';
import 'onboarding_carousel_slider.dart';
import 'onboarding_footer_controls.dart';
import 'onboarding_skip_button.dart';

/// Body content layout for onboarding carousel slides.
class OnboardingContent extends StatelessWidget {
  final PageController controller;
  final VoidCallback onComplete;
  final void Function(int) onNext;

  const OnboardingContent({
    super.key,
    required this.controller,
    required this.onComplete,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingBloc, int>(
      builder: (context, idx) {
        final isLast = idx == OnboardingData.slides.length - 1;
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: OnboardingSkipButton(
                    isLastPage: isLast,
                    onSkip: onComplete,
                  ),
                ),
                Expanded(
                  child: OnboardingCarouselSlider(
                    controller: controller,
                    onPageChanged: (i) => context.read<OnboardingBloc>().add(
                      OnboardingPageChangedEvent(i),
                    ),
                  ),
                ),
                OnboardingFooterControls(
                  count: OnboardingData.slides.length,
                  currentIndex: idx,
                  isLastPage: isLast,
                  onNext: () => onNext(idx),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
