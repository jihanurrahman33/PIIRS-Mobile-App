import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/bloc/locale_bloc.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/language_selector_sheet.dart';

/// Settings tile in citizen profile for switching application language.
class ProfileLanguageTile extends StatelessWidget {
  const ProfileLanguageTile({super.key});

  @override
  Widget build(BuildContext context) {
    bool isBn = false;
    try {
      isBn = context.watch<LocaleBloc>().state.isBangla;
    } catch (_) {}

    final langName = isBn ? 'বাংলা (Bangla)' : 'English';
    return ListTile(
      leading: const Icon(
        Icons.translate_rounded,
        color: AppColors.primarySeed,
      ),
      title: const Text('Language / ভাষা', style: TextStyle(fontSize: 14)),
      subtitle: Text(langName, style: const TextStyle(fontSize: 11)),
      trailing: const Icon(Icons.chevron_right_rounded),
      onTap: () => LanguageSelectorSheet.show(context),
    );
  }
}
