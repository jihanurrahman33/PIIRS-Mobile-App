import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import 'explore_status_chips.dart';
import 'explore_view_toggle.dart';

/// Top search bar, list/map view toggle, and filter chips from Stitch design.
class ExploreFilterHeader extends StatelessWidget {
  final String selectedStatus;
  final ValueChanged<String> onStatusSelected;
  final bool isMapView;
  final ValueChanged<bool> onViewToggle;

  const ExploreFilterHeader({
    super.key,
    required this.selectedStatus,
    required this.onStatusSelected,
    required this.isMapView,
    required this.onViewToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSearchRow(),
        const SizedBox(height: 10),
        ExploreViewToggle(isMapView: isMapView, onViewToggle: onViewToggle),
        const SizedBox(height: 10),
        ExploreStatusChips(
          selectedStatus: selectedStatus,
          onStatusSelected: onStatusSelected,
        ),
        const SizedBox(height: 10),
        _buildNearbyBanner(),
      ],
    );
  }

  Widget _buildSearchRow() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search issues by street, keyword, or ID',
              prefixIcon: const Icon(
                Icons.search_rounded,
                color: AppColors.textMuted,
              ),
              filled: true,
              fillColor: AppColors.lightSurface,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Container(
          height: 48,
          width: 48,
          decoration: BoxDecoration(
            color: AppColors.lightSurface,
            borderRadius: BorderRadius.circular(14),
          ),
          child: const Icon(Icons.tune_rounded, color: AppColors.textSecondary),
        ),
      ],
    );
  }

  Widget _buildNearbyBanner() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.circle, size: 8, color: AppColors.primarySeed),
              SizedBox(width: 6),
              Text(
                '32 active civic reports nearby',
                style: TextStyle(fontSize: 12, color: AppColors.textSecondary),
              ),
            ],
          ),
          Text(
            'Downtown Sector ▾',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: AppColors.primarySeed,
            ),
          ),
        ],
      ),
    );
  }
}
