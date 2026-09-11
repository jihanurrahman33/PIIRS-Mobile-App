import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../widgets/category_item.dart';

/// Centralized category definitions for PIIRS infrastructure issue reporting.
class InfrastructureCategories {
  InfrastructureCategories._();

  static const List<CategoryItem> items = [
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
}
