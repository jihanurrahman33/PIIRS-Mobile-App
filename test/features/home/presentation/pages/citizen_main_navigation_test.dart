import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:zapshift/core/theme/app_theme.dart';
import 'package:zapshift/features/home/presentation/widgets/citizen_bottom_nav_bar.dart';
import 'package:zapshift/features/issues/presentation/pages/explore_issues_page.dart';
import 'package:zapshift/features/issues/presentation/pages/my_issues_page.dart';
import 'package:zapshift/features/issues/presentation/pages/report_issue_page.dart';
import 'package:zapshift/features/profile/presentation/pages/citizen_profile_page.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    GoogleFonts.config.allowRuntimeFetching = false;
  });

  group('Citizen Main Navigation & Shell Tests', () {
    testWidgets('CitizenBottomNavBar renders all 5 navigation items', (
      tester,
    ) async {
      int selectedIndex = 0;
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: Scaffold(
            bottomNavigationBar: CitizenBottomNavBar(
              currentIndex: selectedIndex,
              onTap: (idx) => selectedIndex = idx,
            ),
          ),
        ),
      );

      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Explore'), findsOneWidget);
      expect(find.text('Report'), findsOneWidget);
      expect(find.text('My Issues'), findsOneWidget);
      expect(find.text('Profile'), findsOneWidget);
    });

    testWidgets('ExploreIssuesPage renders search bar and bouncing physics', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: const ExploreIssuesPage(),
        ),
      );

      expect(find.text('Explore Public Issues'), findsOneWidget);
      expect(find.byType(TextField), findsOneWidget);
      final list = tester.widget<ListView>(find.byType(ListView));
      expect(list.physics, isA<BouncingScrollPhysics>());
    });

    testWidgets('ReportIssuePage renders form fields and bouncing physics', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(theme: AppTheme.lightTheme, home: const ReportIssuePage()),
      );

      expect(find.text('Report New Issue'), findsOneWidget);
      expect(find.text('Submit Issue Report'), findsOneWidget);
      final scroll = tester.widget<SingleChildScrollView>(
        find.byType(SingleChildScrollView),
      );
      expect(scroll.physics, isA<BouncingScrollPhysics>());
    });

    testWidgets('MyIssuesPage renders reported issues and bouncing physics', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(theme: AppTheme.lightTheme, home: const MyIssuesPage()),
      );

      expect(find.text('My Reported Issues'), findsOneWidget);
      final list = tester.widget<ListView>(find.byType(ListView));
      expect(list.physics, isA<BouncingScrollPhysics>());
    });

    testWidgets('CitizenProfilePage renders user info and bouncing physics', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: const CitizenProfilePage(),
        ),
      );

      expect(find.text('My Profile'), findsOneWidget);
      expect(find.text('Citizen User'), findsOneWidget);
      expect(find.text('Upgrade to Premium'), findsOneWidget);
      final list = tester.widget<ListView>(find.byType(ListView));
      expect(list.physics, isA<BouncingScrollPhysics>());
    });
  });
}
