import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import 'home_post_media.dart';

/// Post content displaying title, optional description, and media attachment.
class HomePostContent extends StatelessWidget {
  final String title;
  final String description;
  final String? imagePath;
  final String category;

  const HomePostContent({
    super.key,
    required this.title,
    this.description = '',
    this.imagePath,
    this.category = 'Infrastructure',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        if (description.isNotEmpty) ...[
          const SizedBox(height: 4),
          Text(
            description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 13,
              color: AppColors.textSecondary,
            ),
          ),
        ],
        if (imagePath != null) ...[
          const SizedBox(height: 10),
          HomePostMedia(imagePath: imagePath!, categoryTag: category),
        ],
      ],
    );
  }
}
