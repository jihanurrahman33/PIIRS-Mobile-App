import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

/// State representing current application locale.
class LocaleState extends Equatable {
  final Locale locale;

  const LocaleState({this.locale = const Locale('en')});

  bool get isBangla => locale.languageCode == 'bn';

  LocaleState copyWith({Locale? locale}) {
    return LocaleState(locale: locale ?? this.locale);
  }

  @override
  List<Object?> get props => [locale];
}
