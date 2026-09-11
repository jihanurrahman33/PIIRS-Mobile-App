import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../services/secure_storage_service.dart';
import 'locale_event.dart';
import 'locale_state.dart';

/// Bloc managing active application language and persistence.
class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
  final SecureStorageService? _storageService;
  static const _key = 'app_locale';

  LocaleBloc({SecureStorageService? storageService})
    : _storageService = storageService,
      super(const LocaleState()) {
    on<LoadSavedLocaleEvent>(_onLoadSavedLocale);
    on<ChangeLocaleEvent>(_onChangeLocale);
  }

  Future<void> _onLoadSavedLocale(
    LoadSavedLocaleEvent event,
    Emitter<LocaleState> emit,
  ) async {
    try {
      final code = await _storageService?.read(key: _key);
      if (code != null && code.isNotEmpty) {
        emit(state.copyWith(locale: Locale(code)));
      }
    } catch (_) {}
  }

  Future<void> _onChangeLocale(
    ChangeLocaleEvent event,
    Emitter<LocaleState> emit,
  ) async {
    emit(state.copyWith(locale: event.locale));
    try {
      await _storageService?.write(key: _key, value: event.locale.languageCode);
    } catch (_) {}
  }
}
