import 'package:flutter/material.dart';

import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/skeleton_loader.dart';

/// Shimmer skeleton placeholder mimicking an issue post card layout.
class HomePostSkeletonCard extends StatelessWidget {
  const HomePostSkeletonCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerLoader(
      child: AppCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const SkeletonBox(width: 38, height: 38, borderRadius: 19),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    SkeletonBox(width: 110, height: 12),
                    SizedBox(height: 6),
                    SkeletonBox(width: 70, height: 10),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),
            const SkeletonBox(width: double.infinity, height: 16),
            const SizedBox(height: 6),
            const SkeletonBox(width: 200, height: 12),
            const SizedBox(height: 10),
            const SkeletonBox(
              width: double.infinity,
              height: 140,
              borderRadius: 12,
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                SkeletonBox(width: 80, height: 26, borderRadius: 13),
                SkeletonBox(width: 70, height: 26, borderRadius: 13),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
