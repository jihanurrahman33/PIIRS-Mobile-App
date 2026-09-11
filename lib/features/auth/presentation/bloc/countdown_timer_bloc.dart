import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'countdown_timer_event.dart';

/// BLoC managing countdown timers for OTP and verification links.
class CountdownTimerBloc extends Bloc<CountdownTimerEvent, int> {
  Timer? _timer;

  CountdownTimerBloc({int initialSeconds = 60}) : super(initialSeconds) {
    on<StartCountdownTimerEvent>(_onStart);
    on<TimerTickedEvent>(_onTicked);
    if (initialSeconds > 0) {
      add(StartCountdownTimerEvent(seconds: initialSeconds));
    }
  }

  void _onStart(StartCountdownTimerEvent event, Emitter<int> emit) {
    _timer?.cancel();
    emit(event.seconds);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state > 1) {
        add(TimerTickedEvent(state - 1));
      } else {
        add(const TimerTickedEvent(0));
        timer.cancel();
      }
    });
  }

  void _onTicked(TimerTickedEvent event, Emitter<int> emit) {
    emit(event.remainingSeconds);
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
