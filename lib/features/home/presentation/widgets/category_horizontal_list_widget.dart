import 'package:flutter/material.dart';

import '../models/infrastructure_categories.dart';
import 'category_chip_card.dart';

/// Compact horizontal scrolling category row for Home screen.
class CategoryHorizontalListWidget extends StatelessWidget {
  final ValueChanged<String>? onCategoryTap;

  const CategoryHorizontalListWidget({super.key, this.onCategoryTap});

  @override
  Widget build(BuildContext context) {
    final categories = InfrastructureCategories.items;
    return SizedBox(
      height: 38,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final item = categories[index];
          return CategoryChipCard(
            item: item,
            onTap: () => onCategoryTap?.call(item.title),
          );
        },
      ),
    );
  }
}
