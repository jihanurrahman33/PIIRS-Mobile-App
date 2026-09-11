import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../widgets/category_grid_widget.dart';
import '../widgets/home_header_widget.dart';
import '../widgets/home_hero_banner_widget.dart';
import '../widgets/home_recent_report_card.dart';
import '../widgets/home_summary_card.dart';

/// Citizen Home Dashboard reflecting Stitch Civic Modern UI architecture.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: AppColors.primarySeed,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.bolt_rounded,
                size: 20,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 8),
            const Text('PIIRS', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search_rounded),
            onPressed: () => context.push('/search'),
          ),
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () => context.push('/notifications'),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeHeaderWidget(),
              const SizedBox(height: 16),
              const HomeHeroBannerWidget(),
              const SizedBox(height: 16),
              const HomeSummaryCard(),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Infrastructure Categories',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () => context.push('/categories'),
                    child: const Text('View All'),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              CategoryGridWidget(onCategoryTap: (_) => context.push('/search')),
              const SizedBox(height: 20),
              const Text(
                'Recent Community Reports',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              HomeRecentReportCard(
                title: 'Deep pothole on Main Street near intersection',
                location: 'Sector 4',
                status: 'In Progress',
                upvotes: 12,
                timeAgo: '2 hours ago',
                onTap: () => context.push('/issues/details/101'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
