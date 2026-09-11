import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zapshift/core/bloc/locale_bloc.dart';
import 'package:zapshift/core/widgets/language_selector_sheet.dart';
import 'package:zapshift/features/home/presentation/widgets/home_language_button.dart';
import 'package:zapshift/features/profile/presentation/widgets/profile_language_tile.dart';
import 'package:zapshift/l10n/generated/app_localizations.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Localization Widgets Tests', () {
    late LocaleBloc bloc;

    setUp(() => bloc = LocaleBloc());
    tearDown(() => bloc.close());

    Widget wrap(Widget child) => BlocProvider<LocaleBloc>.value(
      value: bloc,
      child: MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(body: child),
      ),
    );

    testWidgets('LanguageSelectorSheet renders English and Bangla options', (
      tester,
    ) async {
      await tester.pumpWidget(wrap(const LanguageSelectorSheet()));
      expect(find.textContaining('Select Language'), findsOneWidget);
      expect(find.text('English'), findsOneWidget);
      expect(find.text('বাংলা (Bangla)'), findsOneWidget);

      await tester.tap(find.text('বাংলা (Bangla)'));
      await tester.pumpAndSettle();
      expect(bloc.state.isBangla, isTrue);
    });

    testWidgets('HomeLanguageButton triggers ChangeLocaleEvent on tap', (
      tester,
    ) async {
      await tester.pumpWidget(wrap(const HomeLanguageButton()));
      expect(find.text('বাং'), findsOneWidget);

      await tester.tap(find.text('বাং'));
      expect(bloc.state.isBangla, isTrue);
    });

    testWidgets(
      'ProfileLanguageTile renders language title and active language',
      (tester) async {
        await tester.pumpWidget(wrap(const ProfileLanguageTile()));
        expect(find.text('Language / ভাষা'), findsOneWidget);
        expect(find.text('English'), findsOneWidget);
      },
    );
  });
}
