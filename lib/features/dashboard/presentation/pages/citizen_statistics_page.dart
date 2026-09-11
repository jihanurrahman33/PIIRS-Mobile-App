import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/citizen_impact_score_card.dart';
import '../widgets/citizen_next_tier_card.dart';
import '../widgets/citizen_stats_metrics_row.dart';
import '../widgets/civic_badges_showcase_widget.dart';

/// Screen displaying detailed citizen impact statistics, upvotes, and badges.
class CitizenStatisticsPage extends StatelessWidget {
  const CitizenStatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => context.pop(),
        ),
        title: const Text('My Statistics'),
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CitizenImpactScoreCard(),
              SizedBox(height: 16),
              CitizenStatsMetricsRow(),
              SizedBox(height: 16),
              CivicBadgesShowcaseWidget(),
              SizedBox(height: 16),
              CitizenNextTierCard(),
            ],
          ),
        ),
      ),
    );
  }
}
