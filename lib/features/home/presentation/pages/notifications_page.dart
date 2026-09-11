import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/notification_bloc.dart';
import '../bloc/notification_event.dart';
import '../bloc/notification_state.dart';
import '../widgets/notifications_feed_list.dart';

/// Notification Feed Screen displaying issue status updates & alerts.
class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final NotificationBloc _bloc = NotificationBloc();

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: BlocBuilder<NotificationBloc, NotificationState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_rounded),
                onPressed: () => context.pop(),
              ),
              title: const Text('Notifications'),
              actions: [
                TextButton(
                  onPressed: () =>
                      _bloc.add(const MarkAllNotificationsReadEvent()),
                  child: const Text('Mark all read'),
                ),
              ],
            ),
            body: SafeArea(
              child: NotificationsFeedList(allMarkedRead: state.allMarkedRead),
            ),
          );
        },
      ),
    );
  }
}
