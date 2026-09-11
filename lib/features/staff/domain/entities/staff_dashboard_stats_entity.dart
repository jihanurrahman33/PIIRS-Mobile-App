import 'package:equatable/equatable.dart';

/// Pure domain entity representing staff dashboard performance metrics.
class StaffDashboardStatsEntity extends Equatable {
  final int assignedCount;
  final int resolvedCount;
  final int openCount;
  final int assignedToYou;
  final String avgResponseHours;
  final List<Map<String, dynamic>> last7Days;

  const StaffDashboardStatsEntity({
    required this.assignedCount,
    required this.resolvedCount,
    required this.openCount,
    required this.assignedToYou,
    required this.avgResponseHours,
    this.last7Days = const [],
  });

  @override
  List<Object?> get props => [
    assignedCount,
    resolvedCount,
    openCount,
    assignedToYou,
    avgResponseHours,
    last7Days,
  ];
}
