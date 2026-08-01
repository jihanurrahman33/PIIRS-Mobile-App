import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

/// Item data class for issue category icons & badges.
class CategoryItem {
  final String title;
  final IconData icon;
  final int count;
  final Color color;

  const CategoryItem({
    required this.title,
    required this.icon,
    required this.count,
    required this.color,
  });
}

/// 6-item category grid component displaying issue categories with count badges.
class CategoryGridWidget extends StatelessWidget {
  final ValueChanged<String>? onCategoryTap;

  const CategoryGridWidget({
    super.key,
    this.onCategoryTap,
  });

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
      color: Colors.amber,
    ),
    CategoryItem(
      title: 'Water & Sewage',
      icon: Icons.water_drop_rounded,
      count: 27,
      color: Colors.blue,
    ),
    CategoryItem(
      title: 'Sidewalks',
      icon: Icons.directions_walk_rounded,
      count: 14,
      color: Colors.teal,
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
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = MediaQuery.of(context).size.width;
        final parentWidth = constraints.maxWidth.isFinite
            ? constraints.maxWidth
            : (screenWidth - 32.0);
        final itemWidth = (parentWidth - 24.0) / 3;

        return Wrap(
          spacing: 12,
          runSpacing: 12,
          children: _categories.map((item) {
            return SizedBox(
              width: itemWidth > 0 ? itemWidth : 100.0,
              height: (itemWidth > 0 ? itemWidth : 100.0) * 0.95,
              child: _buildCategoryCard(context, item),
            );
          }).toList(),
        );
      },
    );
  }

  Widget _buildCategoryCard(BuildContext context, CategoryItem item) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () => onCategoryTap?.call(item.title),
      borderRadius: BorderRadius.circular(16.0),
      child: Container(
        padding: const EdgeInsets.all(6.0),
        decoration: BoxDecoration(
          color: item.color.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(
            color: item.color.withValues(alpha: 0.2),
            width: 1.0,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(item.icon, size: 24, color: item.color),
            const SizedBox(height: 4),
            Text(
              item.title,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 11,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              '${item.count} issues',
              style: theme.textTheme.labelSmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
                fontSize: 9,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
