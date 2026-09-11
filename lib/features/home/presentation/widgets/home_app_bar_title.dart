import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

/// App bar title widget with PIIRS brand icon and text.
class HomeAppBarTitle extends StatelessWidget {
  const HomeAppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: AppColors.primarySeed,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(Icons.bolt_rounded, size: 20, color: Colors.white),
        ),
        const SizedBox(width: 8),
        const Text('PIIRS', style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}
