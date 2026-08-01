import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/notification_tile.dart';

/// Notification Feed Screen displaying issue status updates & alerts.
class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  bool _allMarkedRead = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => context.pop(),
        ),
        title: const Text('Notifications'),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                _allMarkedRead = true;
              });
            },
            child: const Text('Mark all read'),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            NotificationTile(
              title: 'Issue Status Updated',
              message:
                  'Your reported issue #ZAP-101 "Pothole on 3rd Avenue" was updated to IN PROGRESS.',
              timeAgo: '10m ago',
              isRead: _allMarkedRead,
            ),
            const SizedBox(height: 12),
            NotificationTile(
              title: 'Community Upvote Milestone',
              message:
                  'Your report "Broken Street Light" reached 25 community upvotes!',
              timeAgo: '2h ago',
              isRead: _allMarkedRead,
            ),
            const SizedBox(height: 12),
            NotificationTile(
              title: 'Issue Resolved',
              message:
                  'Staff member assigned to "Water pipe leak" marked the repair as RESOLVED.',
              timeAgo: '1d ago',
              isRead: true,
            ),
          ],
        ),
      ),
    );
  }
}
