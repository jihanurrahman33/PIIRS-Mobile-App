import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zapshift/core/errors/failures.dart';
import 'package:zapshift/core/theme/app_theme.dart';
import 'package:zapshift/core/utils/responsive.dart';
import 'package:zapshift/core/widgets/app_animations.dart';
import 'package:zapshift/core/widgets/error_view.dart';
import 'package:zapshift/core/widgets/skeleton_loader.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('ResponsiveLayout Tests', () {
    testWidgets('renders mobile widget when width < 600', (tester) async {
      tester.view.physicalSize = const Size(500, 800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      await tester.pumpWidget(
        MaterialApp(
          home: ResponsiveLayout(
            mobile: const Text('Mobile UI'),
            desktop: const Text('Desktop UI'),
          ),
        ),
      );

      expect(find.text('Mobile UI'), findsOneWidget);
      expect(find.text('Desktop UI'), findsNothing);
    });

    testWidgets('renders desktop widget when width >= 1024', (tester) async {
      tester.view.physicalSize = const Size(1200, 800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      await tester.pumpWidget(
        MaterialApp(
          home: ResponsiveLayout(
            mobile: const Text('Mobile UI'),
            desktop: const Text('Desktop UI'),
          ),
        ),
      );

      expect(find.text('Desktop UI'), findsOneWidget);
      expect(find.text('Mobile UI'), findsNothing);
    });
  });

  group('FadeInSlide Animation Tests', () {
    testWidgets('renders child widget with entrance transition',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FadeInSlide(
              child: const Text('Animated Child'),
            ),
          ),
        ),
      );

      expect(find.text('Animated Child'), findsOneWidget);
    });
  });

  group('SkeletonLoader Tests', () {
    testWidgets('renders SkeletonCard and SkeletonListTile', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: const Scaffold(
            body: Column(
              children: [
                SkeletonCard(),
                SkeletonListTile(),
              ],
            ),
          ),
        ),
      );

      expect(find.byType(SkeletonCard), findsOneWidget);
      expect(find.byType(SkeletonListTile), findsOneWidget);
    });
  });

  group('ErrorView Tests', () {
    testWidgets('renders ErrorView correctly from Failure', (tester) async {
      bool retryPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: Scaffold(
            body: ErrorView.fromFailure(
              const NetworkFailure('No Internet'),
              onRetry: () {
                retryPressed = true;
              },
            ),
          ),
        ),
      );

      expect(find.text('Connection Issue'), findsOneWidget);
      expect(find.text('No Internet'), findsOneWidget);
      expect(find.text('Try Again'), findsOneWidget);

      await tester.tap(find.text('Try Again'));
      expect(retryPressed, isTrue);
    });
  });
}
