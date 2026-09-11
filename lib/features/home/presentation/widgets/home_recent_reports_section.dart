import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../models/sample_home_feed_posts.dart';
import 'home_recent_report_card.dart';

/// Recent community reports section for the citizen home dashboard.
class HomeRecentReportsSection extends StatelessWidget {
  const HomeRecentReportsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Recent Community Reports',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () => context.push('/issues'),
              child: const Text(
                'View All',
                style: TextStyle(
                  color: AppColors.primarySeed,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ...SampleHomeFeedPosts.items.map(
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
        ),
      ],
    );
  }
}
