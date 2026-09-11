import 'package:flutter/widgets.dart';
import '../../l10n/generated/app_localizations.dart';

/// Extension for convenient access to localized strings.
extension LocalizationExtension on BuildContext {
  AppLocalizations? get l10n => AppLocalizations.of(this);
}
