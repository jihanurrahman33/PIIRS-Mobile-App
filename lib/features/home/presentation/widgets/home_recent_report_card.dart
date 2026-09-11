import 'package:flutter/material.dart';

import '../../../../core/widgets/app_card.dart';
import 'home_post_actions.dart';
import 'home_post_content.dart';
import 'home_post_header.dart';

/// Issue card rendered in a social post format on the Home feed.
class HomeRecentReportCard extends StatelessWidget {
  final String title;
  final String description;
  final String location;
  final String status;
  final int upvotes;
  final int commentCount;
  final String timeAgo;
  final String reporterName;
  final String? imagePath;
  final String category;
  final VoidCallback? onTap;

  const HomeRecentReportCard({
    super.key,
    required this.title,
    this.description = '',
    required this.location,
    required this.status,
    required this.upvotes,
    this.commentCount = 0,
    required this.timeAgo,
    this.reporterName = 'Citizen Reporter',
    this.imagePath,
    this.category = 'Infrastructure',
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomePostHeader(
            reporterName: reporterName,
            location: location,
            timeAgo: timeAgo,
            status: status,
          ),
          const SizedBox(height: 10),
          HomePostContent(
            title: title,
            description: description,
            imagePath: imagePath,
            category: category,
          ),
          const SizedBox(height: 10),
          const Divider(height: 1, thickness: 0.5),
          const SizedBox(height: 8),
          HomePostActions(
            initialUpvotes: upvotes,
            commentCount: commentCount,
            onCommentTap: onTap,
          ),
        ],
      ),
    );
  }
}
