import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zapshift/core/theme/app_theme.dart';
import 'package:zapshift/core/theme/app_theme_extensions.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    GoogleFonts.config.allowRuntimeFetching = false;
  });

  group('AppTheme Tests', () {
    test('lightTheme has Material 3 enabled and valid StatusColors extension', () {
      final theme = AppTheme.lightTheme;
      expect(theme.useMaterial3, isTrue);
      expect(theme.brightness, Brightness.light);

      final statusColors = theme.extension<StatusColors>();
      expect(statusColors, isNotNull);
      expect(statusColors?.pending, isA<Color>());
    });

    test('darkTheme has Material 3 enabled and valid StatusColors extension', () {
      final theme = AppTheme.darkTheme;
      expect(theme.useMaterial3, isTrue);
      expect(theme.brightness, Brightness.dark);

      final statusColors = theme.extension<StatusColors>();
      expect(statusColors, isNotNull);
      expect(statusColors?.pending, isA<Color>());
    });
  });
}
