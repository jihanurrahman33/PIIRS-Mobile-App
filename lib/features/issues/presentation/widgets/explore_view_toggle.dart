import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

/// List / Map view toggle switch component.
class ExploreViewToggle extends StatelessWidget {
  final bool isMapView;
  final ValueChanged<bool> onViewToggle;

  const ExploreViewToggle({
    super.key,
    required this.isMapView,
    required this.onViewToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          _toggleBtn(
            'List View',
            Icons.view_agenda_rounded,
            !isMapView,
            () => onViewToggle(false),
          ),
          _toggleBtn(
            'Map View',
            Icons.location_on_rounded,
            isMapView,
            () => onViewToggle(true),
          ),
        ],
      ),
    );
  }

  Widget _toggleBtn(
    String text,
    IconData icon,
    bool active,
    VoidCallback onTap,
  ) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: active ? AppColors.lightSurface : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 16,
                color: active ? AppColors.primarySeed : AppColors.textSecondary,
              ),
              const SizedBox(width: 6),
              Text(
                text,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: active ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
