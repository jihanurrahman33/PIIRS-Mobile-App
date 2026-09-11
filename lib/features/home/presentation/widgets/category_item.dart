import 'package:flutter/material.dart';

/// Item data model for issue category icons and badges.
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
