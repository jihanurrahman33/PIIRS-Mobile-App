import 'package:equatable/equatable.dart';

/// Base event for CountdownTimerBloc.
abstract class CountdownTimerEvent extends Equatable {
  const CountdownTimerEvent();

  @override
  List<Object?> get props => [];
}

/// Event to start or reset countdown timer.
class StartCountdownTimerEvent extends CountdownTimerEvent {
  final int seconds;

  const StartCountdownTimerEvent({this.seconds = 60});

  @override
  List<Object?> get props => [seconds];
}

/// Internal tick event emitted each second.
class TimerTickedEvent extends CountdownTimerEvent {
  final int remainingSeconds;

  const TimerTickedEvent(this.remainingSeconds);

  @override
  List<Object?> get props => [remainingSeconds];
}
