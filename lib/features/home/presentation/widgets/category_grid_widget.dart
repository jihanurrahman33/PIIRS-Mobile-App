import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import 'category_item.dart';

/// 6-item category grid component reflecting Stitch Civic Modern system.
class CategoryGridWidget extends StatelessWidget {
  final ValueChanged<String>? onCategoryTap;

  const CategoryGridWidget({super.key, this.onCategoryTap});

  static const List<CategoryItem> _categories = [
    CategoryItem(
      title: 'Roads & Potholes',
      icon: Icons.add_road_rounded,
      count: 42,
      color: AppColors.primarySeed,
    ),
    CategoryItem(
      title: 'Street Lighting',
      icon: Icons.lightbulb_rounded,
      count: 18,
      color: AppColors.pending,
    ),
    CategoryItem(
      title: 'Water & Sewage',
      icon: Icons.water_drop_rounded,
      count: 27,
      color: AppColors.inProgress,
    ),
    CategoryItem(
      title: 'Sidewalks',
      icon: Icons.directions_walk_rounded,
      count: 14,
      color: AppColors.resolved,
    ),
    CategoryItem(
      title: 'Parks & Trees',
      icon: Icons.park_rounded,
      count: 9,
      color: Colors.green,
    ),
    CategoryItem(
      title: 'Waste & Litter',
      icon: Icons.delete_outline_rounded,
      count: 31,
      color: Colors.deepOrange,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1.05,
      ),
      itemCount: _categories.length,
      itemBuilder: (context, i) => _buildCard(context, _categories[i]),
    );
  }

  Widget _buildCard(BuildContext context, CategoryItem item) {
    return InkWell(
      onTap: () => onCategoryTap?.call(item.title),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          color: item.color.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: item.color.withValues(alpha: 0.2)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(item.icon, size: 24, color: item.color),
            const SizedBox(height: 6),
            Text(
              item.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 11),
            ),
            Text(
              '${item.count} issues',
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
