import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:zapshift/core/services/onboarding_storage.dart';
import 'package:zapshift/core/theme/app_theme.dart';
import 'package:zapshift/features/auth/presentation/pages/app_update_page.dart';
import 'package:zapshift/features/auth/presentation/pages/maintenance_page.dart';
import 'package:zapshift/features/auth/presentation/pages/onboarding_page.dart';

class FakeOnboardingStorage implements OnboardingStorage {
  bool isCompleted = false;

  @override
  Future<bool> isOnboardingCompleted() async => isCompleted;

  @override
  Future<void> setOnboardingCompleted() async {
    isCompleted = true;
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    GoogleFonts.config.allowRuntimeFetching = false;
  });

  group('OnboardingPage Tests', () {
    testWidgets('renders first onboarding slide correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: const OnboardingPage(),
        ),
      );

      expect(find.text('Report Issues Seamlessly'), findsOneWidget);
      expect(find.text('Skip'), findsOneWidget);
      expect(find.text('Next'), findsOneWidget);
    });

    testWidgets('advances to next slide on Next button tap', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: const OnboardingPage(),
        ),
      );

      await tester.tap(find.text('Next'));
      await tester.pumpAndSettle();

      expect(find.text('Track Status Real-Time'), findsOneWidget);
    });
  });

  group('AppUpdatePage Tests', () {
    testWidgets('renders AppUpdatePage with version details', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: const AppUpdatePage(latestVersion: 'v1.5.0'),
        ),
      );

      expect(find.text('New Update Available!'), findsOneWidget);
      expect(find.text('Version v1.5.0'), findsOneWidget);
      expect(find.text('Update Now'), findsOneWidget);
    });
  });

  group('MaintenancePage Tests', () {
    testWidgets('renders MaintenancePage with status explanation',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: const MaintenancePage(),
        ),
      );

      expect(find.text('System Under Maintenance'), findsOneWidget);
      expect(find.text('Check Status'), findsOneWidget);
    });
  });
}
