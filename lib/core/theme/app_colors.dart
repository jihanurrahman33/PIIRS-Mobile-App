import 'package:flutter/material.dart';

/// Centralized color palette for ZapShift / PIIRS Mobile Application.
abstract class AppColors {
  // Brand Primary Seed Color
  static const Color primarySeed = Color(0xFF6366F1); // Indigo / Electric Purple
  static const Color primaryDarkSeed = Color(0xFF818CF8);

  // Status & Priority Colors
  static const Color pending = Color(0xFFF59E0B); // Amber
  static const Color inProgress = Color(0xFF3B82F6); // Blue
  static const Color resolved = Color(0xFF10B981); // Emerald / Green
  static const Color rejected = Color(0xFFEF4444); // Red
  static const Color boosted = Color(0xFF8B5CF6); // Violet

  // Priority Colors
  static const Color priorityLow = Color(0xFF10B981);
  static const Color priorityNormal = Color(0xFF3B82F6);
  static const Color priorityHigh = Color(0xFFF59E0B);
  static const Color priorityUrgent = Color(0xFFEF4444);

  // Neutral Background & Surface Colors (Light)
  static const Color lightBackground = Color(0xFFF8FAFC);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightCard = Color(0xFFFFFFFF);

  // Neutral Background & Surface Colors (Dark)
  static const Color darkBackground = Color(0xFF0F172A);
  static const Color darkSurface = Color(0xFF1E293B);
  static const Color darkCard = Color(0xFF1E293B);
}
