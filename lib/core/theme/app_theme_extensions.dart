import 'package:flutter/material.dart';

import 'app_colors.dart';

/// ThemeExtension for custom domain-specific issue status and priority colors.
@immutable
class StatusColors extends ThemeExtension<StatusColors> {
  final Color pending;
  final Color inProgress;
  final Color resolved;
  final Color rejected;
  final Color boosted;

  const StatusColors({
    required this.pending,
    required this.inProgress,
    required this.resolved,
    required this.rejected,
    required this.boosted,
  });

  /// Light theme default status colors.
  static const StatusColors light = StatusColors(
    pending: AppColors.pending,
    inProgress: AppColors.inProgress,
    resolved: AppColors.resolved,
    rejected: AppColors.rejected,
    boosted: AppColors.boosted,
  );

  /// Dark theme default status colors.
  static const StatusColors dark = StatusColors(
    pending: Color(0xFFFBBF24),
    inProgress: Color(0xFF60A5FA),
    resolved: Color(0xFF34D399),
    rejected: Color(0xFFF87171),
    boosted: Color(0xFFA78BFA),
  );

  @override
  StatusColors copyWith({
    Color? pending,
    Color? inProgress,
    Color? resolved,
    Color? rejected,
    Color? boosted,
  }) {
    return StatusColors(
      pending: pending ?? this.pending,
      inProgress: inProgress ?? this.inProgress,
      resolved: resolved ?? this.resolved,
      rejected: rejected ?? this.rejected,
      boosted: boosted ?? this.boosted,
    );
  }

  @override
  StatusColors lerp(ThemeExtension<StatusColors>? other, double t) {
    if (other is! StatusColors) return this;
    return StatusColors(
      pending: Color.lerp(pending, other.pending, t)!,
      inProgress: Color.lerp(inProgress, other.inProgress, t)!,
      resolved: Color.lerp(resolved, other.resolved, t)!,
      rejected: Color.lerp(rejected, other.rejected, t)!,
      boosted: Color.lerp(boosted, other.boosted, t)!,
    );
  }
}
