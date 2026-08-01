import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:zapshift/core/theme/app_theme.dart';
import 'package:zapshift/features/auth/presentation/widgets/auth_header_widget.dart';
import 'package:zapshift/features/auth/presentation/widgets/password_strength_indicator.dart';
import 'package:zapshift/features/auth/presentation/widgets/social_auth_buttons.dart';
import 'package:zapshift/features/auth/presentation/widgets/terms_and_conditions_checkbox.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    GoogleFonts.config.allowRuntimeFetching = false;
  });

  group('Auth Feature Presentation Widgets Tests', () {
    testWidgets('AuthHeaderWidget renders title and subtitle', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: const Scaffold(
            body: AuthHeaderWidget(
              title: 'Welcome Back',
              subtitle: 'Sign in to continue',
            ),
          ),
        ),
      );

      expect(find.text('Welcome Back'), findsOneWidget);
      expect(find.text('Sign in to continue'), findsOneWidget);
    });

    testWidgets('SocialAuthButtons renders Google and Apple buttons',
        (tester) async {
      bool googlePressed = false;
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: Scaffold(
            body: SocialAuthButtons(
              onGoogleTap: () => googlePressed = true,
            ),
          ),
        ),
      );

      expect(find.text('Google'), findsOneWidget);
      expect(find.text('Apple'), findsOneWidget);

      await tester.tap(find.text('Google'));
      expect(googlePressed, isTrue);
    });

    testWidgets('TermsAndConditionsCheckbox toggles checkbox state',
        (tester) async {
      bool checked = false;
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: Scaffold(
            body: StatefulBuilder(
              builder: (context, setState) {
                return TermsAndConditionsCheckbox(
                  value: checked,
                  onChanged: (val) => setState(() => checked = val ?? false),
                );
              },
            ),
          ),
        ),
      );

      expect(find.text('Terms of Service'), findsOneWidget);
      await tester.tap(find.byType(Checkbox));
      await tester.pump();

      expect(checked, isTrue);
    });

    testWidgets('PasswordStrengthIndicator renders password score label',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: const Scaffold(
            body: PasswordStrengthIndicator(password: 'Pass123!'),
          ),
        ),
      );

      expect(find.text('Strong'), findsOneWidget);
    });
  });
}
