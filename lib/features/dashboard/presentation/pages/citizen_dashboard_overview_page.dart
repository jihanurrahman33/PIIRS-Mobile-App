import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/citizen_stats_summary_card.dart';

/// Screen displaying citizen dashboard overview metrics & quick action cards.
class CitizenDashboardOverviewPage extends StatelessWidget {
  const CitizenDashboardOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => context.pop(),
        ),
        title: const Text('Citizen Dashboard'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CitizenStatsSummaryCard(),
              const SizedBox(height: 20),
              ListTile(
                tileColor:
                    Theme.of(context).colorScheme.surfaceContainerHighest,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                leading: const Icon(Icons.bar_chart_rounded),
                title: const Text('Activity Analytics'),
                subtitle: const Text('View monthly issue submission trends'),
                trailing: const Icon(Icons.chevron_right_rounded),
                onTap: () => context.push('/citizen-dashboard/analytics'),
              ),
              const SizedBox(height: 12),
              ListTile(
                tileColor:
                    Theme.of(context).colorScheme.surfaceContainerHighest,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                leading: const Icon(Icons.stars_rounded, color: Colors.amber),
                title: const Text('My Statistics & Badges'),
                subtitle: const Text('Check community impact score'),
                trailing: const Icon(Icons.chevron_right_rounded),
                onTap: () => context.push('/citizen-dashboard/statistics'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
