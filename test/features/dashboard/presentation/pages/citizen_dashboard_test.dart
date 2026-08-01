import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:zapshift/core/theme/app_theme.dart';
import 'package:zapshift/features/dashboard/presentation/pages/citizen_activity_analytics_page.dart';
import 'package:zapshift/features/dashboard/presentation/pages/citizen_dashboard_overview_page.dart';
import 'package:zapshift/features/dashboard/presentation/pages/citizen_statistics_page.dart';
import 'package:zapshift/features/dashboard/presentation/widgets/activity_analytics_chart_card.dart';
import 'package:zapshift/features/dashboard/presentation/widgets/citizen_stats_summary_card.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    GoogleFonts.config.allowRuntimeFetching = false;
  });

  group('Module 6 Citizen Dashboard Widget Tests', () {
    testWidgets(
        'CitizenStatsSummaryCard renders impact score and metric totals',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: const Scaffold(
            body: CitizenStatsSummaryCard(
              totalSubmitted: 20,
              totalResolved: 15,
              impactPoints: 600,
            ),
          ),
        ),
      );

      expect(find.text('Citizen Impact Score'), findsOneWidget);
      expect(find.text('600 pts'), findsOneWidget);
      expect(find.text('20'), findsOneWidget);
      expect(find.text('15'), findsOneWidget);
    });

    testWidgets('ActivityAnalyticsChartCard renders monthly bar charts',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: const Scaffold(
            body: ActivityAnalyticsChartCard(),
          ),
        ),
      );

      expect(find.text('Monthly Activity Analytics'), findsOneWidget);
      expect(find.text('May'), findsOneWidget);
      expect(find.text('Aug'), findsOneWidget);
    });

    testWidgets('CitizenDashboardOverviewPage renders title and shortcuts',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: const CitizenDashboardOverviewPage(),
        ),
      );

      expect(find.text('Citizen Dashboard'), findsOneWidget);
      expect(find.text('Activity Analytics'), findsOneWidget);
      expect(find.text('My Statistics & Badges'), findsOneWidget);
    });

    testWidgets('CitizenActivityAnalyticsPage renders analytics view',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: const CitizenActivityAnalyticsPage(),
        ),
      );

      expect(find.text('Activity Analytics'), findsOneWidget);
    });

    testWidgets('CitizenStatisticsPage renders level, points, and badges',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: const CitizenStatisticsPage(),
        ),
      );

      expect(find.text('My Statistics'), findsOneWidget);
      expect(find.text('Civic Hero Level 3'), findsOneWidget);
      expect(find.text('Achievement Badges'), findsOneWidget);
    });
  });
}
