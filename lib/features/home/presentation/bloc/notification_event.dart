import 'package:equatable/equatable.dart';

/// Base event for NotificationBloc.
abstract class NotificationEvent extends Equatable {
  const NotificationEvent();

  @override
  List<Object?> get props => [];
}

/// Event triggered when user taps 'Mark all read'.
class MarkAllNotificationsReadEvent extends NotificationEvent {
  const MarkAllNotificationsReadEvent();
}
