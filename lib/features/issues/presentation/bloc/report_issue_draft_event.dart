import 'package:equatable/equatable.dart';

/// Base event for ReportIssueDraftBloc.
abstract class ReportIssueDraftEvent extends Equatable {
  const ReportIssueDraftEvent();

  @override
  List<Object?> get props => [];
}

/// Event triggered when issue priority changes.
class ChangePriorityEvent extends ReportIssueDraftEvent {
  final String priority;

  const ChangePriorityEvent(this.priority);

  @override
  List<Object?> get props => [priority];
}

/// Event triggered when anonymous submission toggle changes.
class ToggleAnonymousEvent extends ReportIssueDraftEvent {
  final bool isAnonymous;

  const ToggleAnonymousEvent(this.isAnonymous);

  @override
  List<Object?> get props => [isAnonymous];
}
