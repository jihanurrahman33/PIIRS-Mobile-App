import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/activity_analytics_chart_card.dart';

/// Screen displaying monthly citizen activity breakdown charts.
class CitizenActivityAnalyticsPage extends StatelessWidget {
  const CitizenActivityAnalyticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => context.pop(),
        ),
        title: const Text('Activity Analytics'),
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              ActivityAnalyticsChartCard(),
            ],
          ),
        ),
      ),
    );
  }
}
