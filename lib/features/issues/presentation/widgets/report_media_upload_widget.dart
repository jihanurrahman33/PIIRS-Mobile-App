import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/app_card.dart';

/// Media upload section showing thumbnails and add button from Stitch design.
class ReportMediaUploadWidget extends StatelessWidget {
  const ReportMediaUploadWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Evidence / Media',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
              Text(
                '2 of 4 added',
                style: TextStyle(fontSize: 11, color: AppColors.textMuted),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              _buildThumb(Icons.broken_image_outlined),
              const SizedBox(width: 8),
              _buildThumb(Icons.warning_amber_rounded),
              const SizedBox(width: 8),
              _buildAddButton(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildThumb(IconData icon) {
    return Stack(
      children: [
        Container(
          width: 72,
          height: 72,
          decoration: BoxDecoration(
            color: AppColors.surfaceContainerLow,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: AppColors.textSecondary, size: 26),
        ),
        Positioned(
          top: 4,
          right: 4,
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: const BoxDecoration(
              color: AppColors.rejected,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.close, size: 10, color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _buildAddButton() {
    return Container(
      width: 72,
      height: 72,
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.primarySeed.withValues(alpha: 0.4)),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.add_a_photo_rounded,
            size: 20,
            color: AppColors.primarySeed,
          ),
          SizedBox(height: 3),
          Text(
            '+ Add',
            style: TextStyle(
              fontSize: 10,
              color: AppColors.primarySeed,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
