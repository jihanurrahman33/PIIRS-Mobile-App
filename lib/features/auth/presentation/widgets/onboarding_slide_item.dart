import 'package:flutter/material.dart';

import '../../../../core/widgets/app_animations.dart';
import '../../domain/entities/onboarding_slide.dart';

/// Presentation slide item component for OnboardingPage carousel.
class OnboardingSlideItem extends StatelessWidget {
  final OnboardingSlide slide;
  final int index;

  const OnboardingSlideItem({
    super.key,
    required this.slide,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: FadeInSlide(
        key: ValueKey(index),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                color: slide.accentColor.withValues(alpha: 0.15),
                shape: BoxShape.circle,
              ),
              child: Icon(
                slide.icon,
                size: 72,
                color: slide.accentColor,
              ),
            ),
            const SizedBox(height: 40),
            Text(
              slide.title,
              textAlign: TextAlign.center,
              style: theme.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              slide.description,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
