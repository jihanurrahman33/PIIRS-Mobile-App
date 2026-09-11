import '../../domain/entities/staff_dashboard_stats_entity.dart';

/// Data model representing staff dashboard stats API payload.
class StaffDashboardStatsModel extends StaffDashboardStatsEntity {
  const StaffDashboardStatsModel({
    required super.assignedCount,
    required super.resolvedCount,
    required super.openCount,
    required super.assignedToYou,
    required super.avgResponseHours,
    super.last7Days,
  });

  factory StaffDashboardStatsModel.fromJson(Map<String, dynamic> json) =>
      StaffDashboardStatsModel(
        assignedCount: (json['assignedCount'] as num?)?.toInt() ?? 0,
        resolvedCount: (json['resolvedCount'] as num?)?.toInt() ?? 0,
        openCount: (json['openCount'] as num?)?.toInt() ?? 0,
        assignedToYou: (json['assignedToYou'] as num?)?.toInt() ?? 0,
        avgResponseHours: json['avgResponseHours']?.toString() ?? '-',
        last7Days:
            (json['last7Days'] as List?)
                ?.map((e) => Map<String, dynamic>.from(e as Map))
                .toList() ??
            const [],
      );
}
