import 'package:flutter/material.dart';

/// Data entity representing an onboarding page slide item.
class OnboardingSlide {
  final String title;
  final String description;
  final IconData icon;
  final Color accentColor;

  const OnboardingSlide({
    required this.title,
    required this.description,
    required this.icon,
    required this.accentColor,
  });
}
