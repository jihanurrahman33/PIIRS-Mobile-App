import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:zapshift/core/theme/app_theme.dart';
import 'package:zapshift/features/issues/presentation/pages/all_issues_page.dart';
import 'package:zapshift/features/issues/presentation/pages/assigned_issues_page.dart';
import 'package:zapshift/features/issues/presentation/pages/image_gallery_page.dart';
import 'package:zapshift/features/issues/presentation/pages/image_preview_page.dart';
import 'package:zapshift/features/issues/presentation/pages/issue_comments_page.dart';
import 'package:zapshift/features/issues/presentation/pages/issue_details_page.dart';
import 'package:zapshift/features/issues/presentation/pages/issue_timeline_page.dart';
import 'package:zapshift/features/issues/presentation/pages/latest_issues_page.dart';
import 'package:zapshift/features/issues/presentation/pages/location_picker_page.dart';
import 'package:zapshift/features/issues/presentation/pages/pending_issues_page.dart';
import 'package:zapshift/features/issues/presentation/pages/rejected_issues_page.dart';
import 'package:zapshift/features/issues/presentation/pages/report_success_page.dart';
import 'package:zapshift/features/issues/presentation/pages/resolved_issues_page.dart';
import 'package:zapshift/features/issues/presentation/pages/trending_issues_page.dart';
import 'package:zapshift/features/issues/presentation/widgets/issue_list_card.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    GoogleFonts.config.allowRuntimeFetching = false;
  });

  group('Module 5 Issue Module Widget Tests', () {
    testWidgets('IssueListCard renders title, category, status, and upvotes',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: Scaffold(
            body: IssueListCard(
              title: 'Deep Pothole',
              category: 'Roads',
              status: 'Pending',
              upvotes: 12,
              timeAgo: '1d ago',
            ),
          ),
        ),
      );

      expect(find.text('Deep Pothole'), findsOneWidget);
      expect(find.text('Roads'), findsOneWidget);
      expect(find.text('12'), findsOneWidget);
      expect(find.text('1d ago'), findsOneWidget);
    });

    testWidgets('AllIssuesPage renders public issues feed', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: const AllIssuesPage(),
        ),
      );

      expect(find.text('All Public Issues'), findsOneWidget);
    });

    testWidgets('LatestIssuesPage renders latest issues feed', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: const LatestIssuesPage(),
        ),
      );

      expect(find.text('Latest Issues Feed'), findsOneWidget);
    });

    testWidgets('TrendingIssuesPage renders trending issues feed',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: const TrendingIssuesPage(),
        ),
      );

      expect(find.text('Trending Issues'), findsOneWidget);
    });

    testWidgets('ResolvedIssuesPage renders resolved issues feed',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: const ResolvedIssuesPage(),
        ),
      );

      expect(find.text('Resolved Issues Feed'), findsOneWidget);
    });

    testWidgets('IssueDetailsPage renders issue info and action buttons',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: const IssueDetailsPage(issueId: '101'),
        ),
      );

      expect(find.text('Issue #101'), findsOneWidget);
      expect(find.text('Upvote (24)'), findsOneWidget);
    });

    testWidgets('ImageGalleryPage renders gallery placeholder', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: const ImageGalleryPage(),
        ),
      );

      expect(find.text('Issue Photo Gallery'), findsOneWidget);
    });

    testWidgets('IssueTimelinePage renders progress timeline steps',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: const IssueTimelinePage(issueId: '101'),
        ),
      );

      expect(find.text('Timeline - #101'), findsOneWidget);
      expect(find.text('Report Submitted'), findsOneWidget);
    });

    testWidgets('IssueCommentsPage renders discussion thread and comment input',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: const IssueCommentsPage(issueId: '101'),
        ),
      );

      expect(find.text('Comments - #101'), findsOneWidget);
      expect(find.byType(TextField), findsOneWidget);
    });

    testWidgets('LocationPickerPage renders map picker placeholder',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: const LocationPickerPage(),
        ),
      );

      expect(find.text('Select Issue Location'), findsOneWidget);
      expect(find.text('Confirm Location'), findsOneWidget);
    });

    testWidgets('ImagePreviewPage renders photo preview', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: const ImagePreviewPage(),
        ),
      );

      expect(find.text('Photo Preview'), findsOneWidget);
    });

    testWidgets('ReportSuccessPage renders confirmation notice and buttons',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: const ReportSuccessPage(),
        ),
      );

      expect(find.text('Issue Reported Successfully!'), findsOneWidget);
      expect(find.text('Track Issue Status'), findsOneWidget);
      expect(find.text('Back to Home'), findsOneWidget);
    });

    testWidgets('PendingIssuesPage renders pending reports', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: const PendingIssuesPage(),
        ),
      );

      expect(find.text('Pending Reports'), findsOneWidget);
    });

    testWidgets('AssignedIssuesPage renders assigned issues', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: const AssignedIssuesPage(),
        ),
      );

      expect(find.text('Assigned Issues'), findsOneWidget);
    });

    testWidgets('RejectedIssuesPage renders rejected reports with reasons',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: const RejectedIssuesPage(),
        ),
      );

      expect(find.text('Rejected Reports'), findsOneWidget);
    });
  });
}
