import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

/// Media attachment banner for issue posts on the home feed.
class HomePostMedia extends StatelessWidget {
  final String imagePath;
  final String categoryTag;

  const HomePostMedia({
    super.key,
    required this.imagePath,
    required this.categoryTag,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        children: [
          Image.asset(
            imagePath,
            height: 160,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (_, _, _) => Container(
              height: 140,
              color: AppColors.surfaceContainerLow,
              child: const Center(
                child: Icon(
                  Icons.image_not_supported_outlined,
                  color: AppColors.textMuted,
                ),
              ),
            ),
          ),
          Positioned(
            top: 8,
            left: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.65),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                categoryTag,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
