import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/dependency_injection/service_locator.dart';
import '../../../../core/services/onboarding_storage.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/app_animations.dart';

/// Data class representing an onboarding page slide.
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

/// Interactive 4-slide Onboarding Page for first-time app launch.
class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  static const List<OnboardingSlide> _slides = [
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

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _completeOnboarding() async {
    if (sl.isRegistered<OnboardingStorage>()) {
      await sl<OnboardingStorage>().setOnboardingCompleted();
    }
    if (mounted) {
      context.go('/login');
    }
  }

  void _onNext() {
    if (_currentIndex < _slides.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _completeOnboarding();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isLastPage = _currentIndex == _slides.length - 1;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Top Bar: Skip Button
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Align(
                alignment: Alignment.centerRight,
                child: isLastPage
                    ? const SizedBox(height: 48)
                    : TextButton(
                        onPressed: _completeOnboarding,
                        child: Text(
                          'Skip',
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
              ),
            ),

            // Page View Carousel
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _slides.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  final slide = _slides[index];
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
                },
              ),
            ),

            // Bottom Navigation Controls
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Dot Indicators
                  Row(
                    children: List.generate(
                      _slides.length,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        margin: const EdgeInsets.only(right: 6.0),
                        width: _currentIndex == index ? 24.0 : 8.0,
                        height: 8.0,
                        decoration: BoxDecoration(
                          color: _currentIndex == index
                              ? theme.colorScheme.primary
                              : theme.colorScheme.outlineVariant,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                    ),
                  ),

                  // Next / Get Started Button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(140, 52),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                    onPressed: _onNext,
                    child: Text(isLastPage ? 'Get Started' : 'Next'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
