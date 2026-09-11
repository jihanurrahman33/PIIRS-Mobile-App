import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/app_animations.dart';
import 'quick_report_action_tile.dart';

/// Staggered animated tiles column presenting quick issue report options.
class QuickReportTilesColumn extends StatelessWidget {
  const QuickReportTilesColumn({super.key});

  void _nav(BuildContext context, String route) {
    Navigator.of(context).pop();
    context.push(route);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FadeInSlide(
          delay: const Duration(milliseconds: 50),
          child: QuickReportActionTile(
            icon: Icons.camera_alt_rounded,
            title: 'Snap Photo & Report',
            subtitle: 'Capture evidence directly with camera or gallery',
            color: AppColors.primarySeed,
            onTap: () => _nav(context, '/issues/image-preview'),
          ),
        ),
        const SizedBox(height: 10),
        FadeInSlide(
          delay: const Duration(milliseconds: 100),
          child: QuickReportActionTile(
            icon: Icons.add_location_alt_rounded,
            title: 'Pin Location on Map',
            subtitle: 'Pin the precise GPS coordinates of the problem',
            color: AppColors.inProgress,
            onTap: () => _nav(context, '/issues/location-picker'),
          ),
        ),
        const SizedBox(height: 10),
        FadeInSlide(
          delay: const Duration(milliseconds: 150),
          child: QuickReportActionTile(
            icon: Icons.edit_note_rounded,
            title: 'Complete Issue Form',
            subtitle: 'Fill detailed description, category & priority',
            color: AppColors.resolved,
            onTap: () => _nav(context, '/report-issue'),
          ),
        ),
        const SizedBox(height: 10),
        FadeInSlide(
          delay: const Duration(milliseconds: 200),
          child: QuickReportActionTile(
            icon: Icons.warning_amber_rounded,
            title: 'Urgent Hazard Report',
            subtitle: 'Immediate danger alerts dispatched to municipal staff',
            color: AppColors.rejected,
            onTap: () => _nav(context, '/report-issue'),
          ),
        ),
      ],
    );
  }
}
