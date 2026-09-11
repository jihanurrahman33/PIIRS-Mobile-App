import 'package:flutter_bloc/flutter_bloc.dart';

import 'notification_event.dart';
import 'notification_state.dart';

/// BLoC managing user notification states and read receipts.
class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(const NotificationState()) {
    on<MarkAllNotificationsReadEvent>(_onMarkAllRead);
  }

  void _onMarkAllRead(
    MarkAllNotificationsReadEvent event,
    Emitter<NotificationState> emit,
  ) {
    emit(const NotificationState(allMarkedRead: true));
  }
}
