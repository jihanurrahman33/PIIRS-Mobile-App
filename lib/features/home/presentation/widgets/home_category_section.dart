import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extensions/localization_extension.dart';
import '../../../../core/theme/app_colors.dart';
import 'category_horizontal_list_widget.dart';

/// Section showing compact infrastructure categories with view-all navigation.
class HomeCategorySection extends StatelessWidget {
  const HomeCategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              l10n?.infrastructureCategories ?? 'Infrastructure Categories',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () => context.push('/categories'),
              child: Text(
                l10n?.viewAll ?? 'View All',
                style: const TextStyle(
                  color: AppColors.primarySeed,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        CategoryHorizontalListWidget(
          onCategoryTap: (_) => context.push('/search'),
        ),
      ],
    );
  }
}
