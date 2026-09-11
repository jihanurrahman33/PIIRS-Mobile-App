import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/dependency_injection/service_locator.dart';
import '../../../../core/services/onboarding_storage.dart';
import '../../domain/entities/onboarding_data.dart';
import '../bloc/onboarding_bloc.dart';
import '../widgets/onboarding_content.dart';

/// Interactive 4-slide Onboarding Page powered by OnboardingBloc.
class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _ctrl = PageController();

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

  void _onNext(int idx) {
    if (idx < OnboardingData.slides.length - 1) {
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
    return BlocProvider(
      create: (_) => OnboardingBloc(),
      child: OnboardingContent(
        controller: _ctrl,
        onComplete: _complete,
        onNext: _onNext,
      ),
    );
  }
}
