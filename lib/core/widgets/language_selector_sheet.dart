import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/locale_bloc.dart';
import '../bloc/locale_event.dart';
import '../theme/app_colors.dart';

/// Modal bottom sheet allowing users to switch between English and Bangla.
class LanguageSelectorSheet extends StatelessWidget {
  const LanguageSelectorSheet({super.key});

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) => BlocProvider.value(
        value: context.read<LocaleBloc>(),
        child: const LanguageSelectorSheet(),
      ),
    );
  }

  Widget _tile(BuildContext ctx, String label, String code, bool active) =>
      ListTile(
        title: Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
        trailing: active
            ? const Icon(
                Icons.check_circle_rounded,
                color: AppColors.primarySeed,
              )
            : const Icon(Icons.circle_outlined, color: AppColors.textMuted),
        onTap: () {
          ctx.read<LocaleBloc>().add(ChangeLocaleEvent(Locale(code)));
          Navigator.of(ctx).pop();
        },
      );

  @override
  Widget build(BuildContext context) {
    String cur = 'en';
    try {
      cur = context.watch<LocaleBloc>().state.locale.languageCode;
    } catch (_) {}
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                'Select Language / ভাষা নির্বাচন করুন',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const Divider(),
            _tile(context, 'English', 'en', cur == 'en'),
            _tile(context, 'বাংলা (Bangla)', 'bn', cur == 'bn'),
          ],
        ),
      ),
    );
  }
}
