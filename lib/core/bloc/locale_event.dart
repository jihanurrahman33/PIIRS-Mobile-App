import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

/// Base event for LocaleBloc.
abstract class LocaleEvent extends Equatable {
  const LocaleEvent();

  @override
  List<Object?> get props => [];
}

/// Event triggered to load persisted locale from storage.
class LoadSavedLocaleEvent extends LocaleEvent {
  const LoadSavedLocaleEvent();
}

/// Event triggered to change active application locale.
class ChangeLocaleEvent extends LocaleEvent {
  final Locale locale;

  const ChangeLocaleEvent(this.locale);

  @override
  List<Object?> get props => [locale];
}
