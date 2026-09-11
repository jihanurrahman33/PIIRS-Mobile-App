import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:zapshift/core/theme/app_theme.dart';
import 'package:zapshift/features/auth/domain/entities/user_entity.dart';
import 'package:zapshift/features/profile/presentation/pages/citizen_profile_page.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    GoogleFonts.config.allowRuntimeFetching = false;
  });

  group('CitizenProfilePage Dynamic User Tests', () {
    testWidgets('renders default placeholder when user is null', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: const CitizenProfilePage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('My Profile'), findsOneWidget);
      expect(find.text('Citizen User'), findsOneWidget);
      expect(find.text('alex.morgan@example.com'), findsOneWidget);
      expect(find.text('Upgrade to Premium'), findsOneWidget);
    });

    testWidgets('renders authenticated user details dynamically', (
      tester,
    ) async {
      const authUser = UserEntity(
        id: 'usr-123',
        name: 'Jane Doe',
        email: 'jane.doe@piirs.gov',
        role: 'citizen',
        isPremium: true,
        isVerified: true,
      );

      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: const CitizenProfilePage(user: authUser),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Jane Doe'), findsOneWidget);
      expect(find.text('jane.doe@piirs.gov'), findsOneWidget);
      expect(find.text('Civic Hero (Premium Member) ⭐'), findsOneWidget);
      expect(find.text('Premium Active'), findsOneWidget);
      expect(find.byIcon(Icons.verified_rounded), findsWidgets);
    });

    testWidgets('renders admin user role badge dynamically', (tester) async {
      const adminUser = UserEntity(
        id: 'adm-001',
        name: 'Chief Officer',
        email: 'admin@piirs.gov',
        role: 'admin',
      );

      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: const CitizenProfilePage(user: adminUser),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Chief Officer'), findsOneWidget);
      expect(find.text('admin@piirs.gov'), findsOneWidget);
      expect(find.text('System Administrator 🛡️'), findsOneWidget);
    });
  });
}
