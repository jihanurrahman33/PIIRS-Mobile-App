import 'package:flutter/material.dart';

import 'notification_tile.dart';

/// Feed list of civic alerts and notifications.
class NotificationsFeedList extends StatelessWidget {
  final bool allMarkedRead;

  const NotificationsFeedList({super.key, required this.allMarkedRead});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        NotificationTile(
          title: 'Issue Status Updated',
          message: 'Your reported issue #ZAP-101 was updated to IN PROGRESS.',
          timeAgo: '10m ago',
          isRead: allMarkedRead,
        ),
        const SizedBox(height: 12),
        NotificationTile(
          title: 'Community Upvote Milestone',
          message:
              'Your report "Broken Street Light" reached 25 community upvotes!',
          timeAgo: '2h ago',
          isRead: allMarkedRead,
        ),
        const SizedBox(height: 12),
        const NotificationTile(
          title: 'Issue Resolved',
          message: 'Staff member marked the repair as RESOLVED.',
          timeAgo: '1d ago',
          isRead: true,
        ),
      ],
    );
  }
}
