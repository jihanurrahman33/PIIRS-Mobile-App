import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'category_grid_widget.dart';

/// Section showing infrastructure category grid with view-all navigation.
class HomeCategorySection extends StatelessWidget {
  const HomeCategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Infrastructure Categories',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () => context.push('/categories'),
              child: const Text('View All'),
            ),
          ],
        ),
        const SizedBox(height: 10),
        CategoryGridWidget(onCategoryTap: (_) => context.push('/search')),
      ],
    );
  }
}
