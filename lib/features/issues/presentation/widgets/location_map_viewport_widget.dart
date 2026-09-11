import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

/// Interactive map canvas mockup with radar pulses and suspended pin.
class LocationMapViewportWidget extends StatelessWidget {
  const LocationMapViewportWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFFEEF2F6),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(left: 24, top: 100, child: _label('Pine Street')),
          Positioned(right: 24, bottom: 120, child: _label('Montgomery Metro')),
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: AppColors.primarySeed.withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
          ),
          Container(
            width: 48,
            height: 48,
            decoration: const BoxDecoration(
              color: AppColors.primarySeed,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.primarySeed,
                  blurRadius: 16,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: const Icon(
              Icons.location_on_rounded,
              color: Colors.white,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }

  Widget _label(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
      ),
    );
  }
}
