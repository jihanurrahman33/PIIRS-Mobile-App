import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zapshift/core/bloc/locale_bloc.dart';
import 'package:zapshift/core/bloc/locale_event.dart';
import 'package:zapshift/core/bloc/locale_state.dart';
import 'package:zapshift/core/services/secure_storage_service.dart';
import 'package:zapshift/l10n/generated/app_localizations.dart';

class _FakeStorage implements SecureStorageService {
  final Map<String, String> data = {};
  @override
  Future<void> write({required String key, required String value}) async =>
      data[key] = value;
  @override
  Future<String?> read({required String key}) async => data[key];
  @override
  Future<void> delete({required String key}) async => data.remove(key);
  @override
  Future<void> clearAll() async => data.clear();
}

void main() {
  group('LocaleBloc Unit Tests', () {
    late _FakeStorage storage;
    late LocaleBloc bloc;

    setUp(() {
      storage = _FakeStorage();
      bloc = LocaleBloc(storageService: storage);
    });

    tearDown(() => bloc.close());

    test('initial state defaults to English locale', () {
      expect(bloc.state, equals(const LocaleState(locale: Locale('en'))));
      expect(bloc.state.isBangla, isFalse);
    });

    test(
      'ChangeLocaleEvent updates state to Bangla and persists code',
      () async {
        bloc.add(const ChangeLocaleEvent(Locale('bn')));
        await expectLater(
          bloc.stream,
          emits(const LocaleState(locale: Locale('bn'))),
        );
        expect(bloc.state.isBangla, isTrue);
        expect(await storage.read(key: 'app_locale'), equals('bn'));
      },
    );

    test('LoadSavedLocaleEvent loads persisted locale from storage', () async {
      await storage.write(key: 'app_locale', value: 'bn');
      final newBloc = LocaleBloc(storageService: storage);
      newBloc.add(const LoadSavedLocaleEvent());
      await expectLater(
        newBloc.stream,
        emits(const LocaleState(locale: Locale('bn'))),
      );
      await newBloc.close();
    });

    test(
      'AppLocalizations loads English and Bangla translations correctly',
      () async {
        final en = await AppLocalizations.delegate.load(const Locale('en'));
        final bn = await AppLocalizations.delegate.load(const Locale('bn'));

        expect(en.navHome, equals('Home'));
        expect(bn.navHome, equals('হোম'));
        expect(en.navExplore, equals('Explore'));
        expect(bn.navExplore, equals('অন্বেষণ'));
        expect(bn.language, equals('ভাষা'));
      },
    );
  });
}
