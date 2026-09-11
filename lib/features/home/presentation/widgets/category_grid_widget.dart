import 'package:flutter/material.dart';

import '../models/infrastructure_categories.dart';
import 'category_grid_card.dart';

/// 6-item category grid component reflecting Stitch Civic Modern system.
class CategoryGridWidget extends StatelessWidget {
  final ValueChanged<String>? onCategoryTap;

  const CategoryGridWidget({super.key, this.onCategoryTap});

  @override
  Widget build(BuildContext context) {
    final categories = InfrastructureCategories.items;
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1.05,
      ),
      itemCount: categories.length,
      itemBuilder: (context, i) {
        final item = categories[i];
        return CategoryGridCard(
          item: item,
          onTap: () => onCategoryTap?.call(item.title),
        );
      },
    );
  }
}
