import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/sample_home_feed_posts.dart';
import 'home_recent_report_card.dart';

/// Fallback list rendering sample posts when real data is unavailable.
class HomeRecentFallbackList extends StatelessWidget {
  const HomeRecentFallbackList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: SampleHomeFeedPosts.items
          .map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: HomeRecentReportCard(
                title: item.title,
                description: item.description,
                location: item.location,
                status: item.status,
                upvotes: item.upvotes,
                commentCount: item.commentCount,
                timeAgo: item.timeAgo,
                reporterName: item.reporterName,
                imagePath: item.imagePath,
                category: item.category,
                onTap: () => context.push('/issues/details/${item.id}'),
              ),
            ),
          )
          .toList(),
    );
  }
}
