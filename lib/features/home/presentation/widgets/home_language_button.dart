import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/bloc/locale_bloc.dart';
import '../../../../core/bloc/locale_event.dart';
import '../../../../core/theme/app_colors.dart';

/// App bar action button toggling between English and Bangla locales.
class HomeLanguageButton extends StatelessWidget {
  const HomeLanguageButton({super.key});

  @override
  Widget build(BuildContext context) {
    bool isBn = false;
    try {
      isBn = context.watch<LocaleBloc>().state.isBangla;
    } catch (_) {}

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        try {
          final target = isBn ? const Locale('en') : const Locale('bn');
          context.read<LocaleBloc>().add(ChangeLocaleEvent(target));
        } catch (_) {}
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: AppColors.primarySeed.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: AppColors.primarySeed.withValues(alpha: 0.3),
          ),
        ),
        child: Text(
          isBn ? 'EN' : 'বাং',
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: AppColors.primarySeed,
          ),
        ),
      ),
    );
  }
}
