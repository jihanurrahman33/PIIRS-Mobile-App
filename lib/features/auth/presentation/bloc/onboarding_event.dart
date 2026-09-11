import 'package:equatable/equatable.dart';

/// Base event for OnboardingBloc.
abstract class OnboardingEvent extends Equatable {
  const OnboardingEvent();

  @override
  List<Object?> get props => [];
}

/// Event triggered when onboarding carousel slides to a new index.
class OnboardingPageChangedEvent extends OnboardingEvent {
  final int pageIndex;

  const OnboardingPageChangedEvent(this.pageIndex);

  @override
  List<Object?> get props => [pageIndex];
}
