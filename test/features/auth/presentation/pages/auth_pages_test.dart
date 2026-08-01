import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:zapshift/core/theme/app_theme.dart';
import 'package:zapshift/features/auth/presentation/pages/account_blocked_page.dart';
import 'package:zapshift/features/auth/presentation/pages/email_verification_page.dart';
import 'package:zapshift/features/auth/presentation/pages/forgot_password_page.dart';
import 'package:zapshift/features/auth/presentation/pages/login_page.dart';
import 'package:zapshift/features/auth/presentation/pages/register_page.dart';
import 'package:zapshift/features/auth/presentation/pages/welcome_page.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    GoogleFonts.config.allowRuntimeFetching = false;
  });

  group('Authentication Screens Widget Tests', () {
    testWidgets('renders WelcomePage with branding and action buttons',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: const WelcomePage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Welcome to ZapShift'), findsOneWidget);
      expect(find.text('Sign In'), findsOneWidget);
      expect(find.text('Create Account'), findsOneWidget);
      expect(find.text('Continue as Guest'), findsOneWidget);
    });

    testWidgets('renders LoginPage with form fields and submit button',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: const LoginPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Welcome Back'), findsOneWidget);
      expect(find.text('Email Address'), findsOneWidget);
      expect(find.text('Password'), findsOneWidget);
      expect(find.text('Forgot Password?'), findsOneWidget);
    });

    testWidgets('renders RegisterPage with name, email, and password fields',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: const RegisterPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Create Account'), findsWidgets);
      expect(find.text('Full Name'), findsOneWidget);
      expect(find.text('Email Address'), findsOneWidget);
    });

    testWidgets('renders ForgotPasswordPage with email input', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: const ForgotPasswordPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Reset Password'), findsOneWidget);
      expect(find.text('Send Reset Link'), findsOneWidget);
    });

    testWidgets('renders EmailVerificationPage with inbox notice',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: const EmailVerificationPage(email: 'test@domain.com'),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Verify Your Email'), findsOneWidget);
      expect(find.text("I've Verified My Email"), findsOneWidget);
    });

    testWidgets('renders AccountBlockedPage with notice and contact button',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: const AccountBlockedPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Account Blocked'), findsOneWidget);
      expect(find.text('Contact Support'), findsOneWidget);
    });
  });
}
