import 'package:flutter_bloc/flutter_bloc.dart';

import 'onboarding_event.dart';

/// BLoC managing active slide index for onboarding carousel.
class OnboardingBloc extends Bloc<OnboardingEvent, int> {
  OnboardingBloc() : super(0) {
    on<OnboardingPageChangedEvent>((event, emit) => emit(event.pageIndex));
  }
}
