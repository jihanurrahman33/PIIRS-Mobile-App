import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

/// Floating search input and quick-filter pills on the map viewport.
class LocationPickerSearchBarWidget extends StatelessWidget {
  final VoidCallback onBack;

  const LocationPickerSearchBarWidget({super.key, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_rounded),
                  onPressed: onBack,
                ),
                const Expanded(
                  child: Text(
                    '452 Market Street, Ward 2',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ),
                const Icon(
                  Icons.my_location_rounded,
                  color: AppColors.primarySeed,
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildPill('Current GPS', Icons.gps_fixed_rounded),
                const SizedBox(width: 8),
                _buildPill('Landmarks', Icons.domain_rounded),
                const SizedBox(width: 8),
                _buildPill('Nearby Reports', Icons.warning_amber_rounded),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPill(String text, IconData icon) {
    return Chip(
      avatar: Icon(icon, size: 14),
      label: Text(text, style: const TextStyle(fontSize: 12)),
      visualDensity: VisualDensity.compact,
    );
  }
}
