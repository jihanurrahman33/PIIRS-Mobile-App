import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/dependency_injection/service_locator.dart';
import '../../../../core/services/onboarding_storage.dart';
import '../../domain/entities/onboarding_data.dart';
import '../widgets/onboarding_carousel_slider.dart';
import '../widgets/onboarding_footer_controls.dart';
import '../widgets/onboarding_skip_button.dart';

/// Interactive 4-slide Onboarding Page for first-time app launch.
class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _ctrl = PageController();
  int _idx = 0;

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  Future<void> _complete() async {
    if (sl.isRegistered<OnboardingStorage>()) {
      await sl<OnboardingStorage>().setOnboardingCompleted();
    }
    if (mounted) context.go('/login');
  }

  void _onNext() {
    if (_idx < OnboardingData.slides.length - 1) {
      _ctrl.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _complete();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLast = _idx == OnboardingData.slides.length - 1;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: OnboardingSkipButton(
                isLastPage: isLast,
                onSkip: _complete,
              ),
            ),
            Expanded(
              child: OnboardingCarouselSlider(
                controller: _ctrl,
                onPageChanged: (i) => setState(() => _idx = i),
              ),
            ),
            OnboardingFooterControls(
              count: OnboardingData.slides.length,
              currentIndex: _idx,
              isLastPage: isLast,
              onNext: _onNext,
            ),
          ],
        ),
      ),
    );
  }
}
