import 'package:flutter/material.dart';

import '../../domain/entities/onboarding_data.dart';
import 'onboarding_slide_item.dart';

/// Carousel slider widget displaying paginated onboarding slides.
class OnboardingCarouselSlider extends StatelessWidget {
  final PageController controller;
  final ValueChanged<int> onPageChanged;

  const OnboardingCarouselSlider({
    super.key,
    required this.controller,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller,
      itemCount: OnboardingData.slides.length,
      onPageChanged: onPageChanged,
      itemBuilder: (context, i) =>
          OnboardingSlideItem(slide: OnboardingData.slides[i], index: i),
    );
  }
}
