import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import 'onboarding_slide.dart';

/// Static collection of onboarding slides for first-time launch.
class OnboardingData {
  static const List<OnboardingSlide> slides = [
    OnboardingSlide(
      title: 'Report Issues Seamlessly',
      description:
          'Snap photos, specify location coordinates, and submit public infrastructure problems to city authorities in seconds.',
      icon: Icons.camera_alt_rounded,
      accentColor: AppColors.primarySeed,
    ),
    OnboardingSlide(
      title: 'Track Status Real-Time',
      description:
          'Receive instant timeline notifications from pending to in-progress to resolved as staff work on your report.',
      icon: Icons.timeline_rounded,
      accentColor: AppColors.inProgress,
    ),
    OnboardingSlide(
      title: 'Community Upvotes',
      description:
          'Upvote critical neighborhood issues to boost priority and escalate repairs for your community.',
      icon: Icons.thumb_up_alt_rounded,
      accentColor: AppColors.pending,
    ),
    OnboardingSlide(
      title: 'Empowering Citizens & Staff',
      description:
          'Collaborate directly with city workers and municipal teams to build cleaner, safer, and better infrastructure.',
      icon: Icons.groups_rounded,
      accentColor: AppColors.resolved,
    ),
  ];
}
