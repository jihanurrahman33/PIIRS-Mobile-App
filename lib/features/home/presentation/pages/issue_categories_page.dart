import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/category_grid_widget.dart';

/// Full-screen Category Explorer displaying infrastructure categories.
class IssueCategoriesPage extends StatelessWidget {
  const IssueCategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => context.pop(),
        ),
        title: const Text('Infrastructure Categories'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Browse Issues by Infrastructure Type',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
              const SizedBox(height: 16),
              CategoryGridWidget(
                onCategoryTap: (category) {
                  context.push('/search');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
