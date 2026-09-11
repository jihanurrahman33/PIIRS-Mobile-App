import 'package:flutter/material.dart';

import 'home_post_skeleton_card.dart';

/// Vertical column displaying multiple shimmer post skeletons while loading.
class HomePostSkeletonList extends StatelessWidget {
  final int count;

  const HomePostSkeletonList({super.key, this.count = 2});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        count,
        (_) => const Padding(
          padding: EdgeInsets.only(bottom: 12),
          child: HomePostSkeletonCard(),
        ),
      ),
    );
  }
}
