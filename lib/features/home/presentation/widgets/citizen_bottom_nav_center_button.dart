import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../issues/presentation/widgets/quick_report_action_sheet.dart';

/// Elevated center action button for 'Report New Issue' on bottom navigation.
class CitizenBottomNavCenterButton extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;

  const CitizenBottomNavCenterButton({
    super.key,
    required this.isSelected,
    required this.onTap,
  });

  void _handleTap(BuildContext context) {
    onTap();
    QuickReportActionSheet.show(context);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _handleTap(context),
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppColors.primarySeed, Color(0xFF4F46E5)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primarySeed.withValues(alpha: 0.35),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const Icon(
                Icons.add_rounded,
                size: 20,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 2),
            const Text(
              'Report',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: AppColors.primarySeed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
