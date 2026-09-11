import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:zapshift/core/theme/app_theme.dart';
import 'package:zapshift/features/home/presentation/pages/home_page.dart';
import 'package:zapshift/features/home/presentation/pages/issue_categories_page.dart';
import 'package:zapshift/features/home/presentation/pages/notifications_page.dart';
import 'package:zapshift/features/home/presentation/pages/search_issues_page.dart';
import 'package:zapshift/features/home/presentation/widgets/category_grid_widget.dart';
import 'package:zapshift/features/home/presentation/widgets/home_summary_card.dart';
import 'package:zapshift/features/home/presentation/widgets/home_recent_report_card.dart';
import 'package:zapshift/features/home/presentation/widgets/home_recent_reports_section.dart';
import 'package:zapshift/features/home/presentation/widgets/notification_tile.dart';
import 'package:zapshift/features/home/presentation/widgets/premium_banner_widget.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    GoogleFonts.config.allowRuntimeFetching = false;
  });

  group('Module 4 Home Module Widget Tests', () {
    testWidgets(
      'HomeSummaryCard renders total, in progress, and resolved metrics',
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: AppTheme.lightTheme,
            home: const Scaffold(
              body: HomeSummaryCard(
                totalReported: 30,
                inProgress: 10,
                resolved: 20,
              ),
            ),
          ),
        );

        expect(find.text('Total Reports'), findsOneWidget);
        expect(find.text('30'), findsOneWidget);
        expect(find.text('In Progress'), findsOneWidget);
        expect(find.text('10'), findsOneWidget);
        expect(find.text('Resolved'), findsOneWidget);
        expect(find.text('20'), findsOneWidget);
      },
    );

    testWidgets('CategoryGridWidget renders category items and count badges', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: const Scaffold(body: CategoryGridWidget()),
        ),
      );

      expect(find.text('Roads & Potholes'), findsOneWidget);
      expect(find.text('Street Lighting'), findsOneWidget);
    });

    testWidgets('PremiumBannerWidget renders promo title and upgrade button', (
      tester,
    ) async {
      bool upgraded = false;
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: Scaffold(
            body: SingleChildScrollView(
              child: PremiumBannerWidget(onUpgradeTap: () => upgraded = true),
            ),
          ),
        ),
      );

      expect(find.text('Accelerate City Repairs'), findsOneWidget);
      expect(find.text('Upgrade'), findsOneWidget);

      await tester.tap(find.text('Upgrade'));
      await tester.pump();
      expect(upgraded, isTrue);
    });

    testWidgets('NotificationTile renders title and message text', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: const Scaffold(
            body: NotificationTile(
              title: 'Status Update',
              message: 'Your report was resolved.',
              timeAgo: '5m ago',
            ),
          ),
        ),
      );

      expect(find.text('Status Update'), findsOneWidget);
      expect(find.text('Your report was resolved.'), findsOneWidget);
      expect(find.text('5m ago'), findsOneWidget);
    });

    testWidgets('HomePage renders summary, categories, and recent reports', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(theme: AppTheme.lightTheme, home: const HomePage()),
      );

      expect(find.text('PIIRS'), findsOneWidget);
      expect(find.text('Infrastructure Categories'), findsOneWidget);
      expect(find.text('Recent Community Reports'), findsOneWidget);

      final scroll = tester.widget<SingleChildScrollView>(
        find.byType(SingleChildScrollView),
      );
      expect(scroll.physics, isA<BouncingScrollPhysics>());
    });

    testWidgets('SearchIssuesPage renders search field and filter chips', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(theme: AppTheme.lightTheme, home: const SearchIssuesPage()),
      );

      expect(find.byType(TextField), findsOneWidget);
      expect(find.text('All'), findsOneWidget);
      expect(find.text('Pending'), findsOneWidget);
    });

    testWidgets(
      'NotificationsPage renders notification items and mark read button',
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: AppTheme.lightTheme,
            home: const NotificationsPage(),
          ),
        );

        expect(find.text('Notifications'), findsOneWidget);
        expect(find.text('Mark all read'), findsOneWidget);
      },
    );

    testWidgets('IssueCategoriesPage renders category explorer grid', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: const IssueCategoriesPage(),
        ),
      );

      expect(find.text('Infrastructure Categories'), findsOneWidget);
    });

    testWidgets(
      'HomeRecentReportCard renders social post elements and toggles upvote',
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: AppTheme.lightTheme,
            home: const Scaffold(
              body: HomeRecentReportCard(
                title: 'Hazardous pothole',
                description: 'Damaging tires daily',
                location: 'Sector 4',
                status: 'In Progress',
                upvotes: 10,
                commentCount: 5,
                timeAgo: '2h ago',
                reporterName: 'Marcus Vance',
              ),
            ),
          ),
        );

        expect(find.text('Marcus Vance'), findsOneWidget);
        expect(find.text('Sector 4 • 2h ago'), findsOneWidget);
        expect(find.text('Hazardous pothole'), findsOneWidget);
        expect(find.text('Damaging tires daily'), findsOneWidget);
        expect(find.text('10 upvotes'), findsOneWidget);
        expect(find.text('5 comments'), findsOneWidget);

        await tester.tap(find.text('10 upvotes'));
        await tester.pump();
        expect(find.text('11 upvotes'), findsOneWidget);
      },
    );

    testWidgets(
      'HomeRecentReportsSection renders community issue feed and View All',
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: AppTheme.lightTheme,
            home: const Scaffold(
              body: SingleChildScrollView(child: HomeRecentReportsSection()),
            ),
          ),
        );

        expect(find.text('Recent Community Reports'), findsOneWidget);
        expect(find.text('View All'), findsOneWidget);
        expect(find.text('Marcus Vance'), findsOneWidget);
        expect(find.text('Sarah Jenkins'), findsOneWidget);
        expect(find.text('David Kim'), findsOneWidget);
      },
    );
  });
}
