import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../widgets/home_category_section.dart';
import '../widgets/home_header_widget.dart';
import '../widgets/home_hero_banner_widget.dart';
import '../widgets/home_recent_reports_section.dart';
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
      body: const SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeHeaderWidget(),
              SizedBox(height: 16),
              HomeHeroBannerWidget(),
              SizedBox(height: 16),
              HomeSummaryCard(),
              SizedBox(height: 20),
              HomeCategorySection(),
              SizedBox(height: 20),
              HomeRecentReportsSection(),
            ],
          ),
        ),
      ),
    );
  }
}
