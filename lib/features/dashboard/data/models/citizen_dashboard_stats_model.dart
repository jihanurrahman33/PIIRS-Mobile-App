import '../../domain/entities/citizen_dashboard_stats_entity.dart';

/// Data layer model extending CitizenDashboardStatsEntity with JSON parsing.
class CitizenDashboardStatsModel extends CitizenDashboardStatsEntity {
  const CitizenDashboardStatsModel({
    required super.totalSubmitted,
    required super.totalResolved,
    required super.totalInProgress,
    required super.totalUpvotesGiven,
    required super.impactPoints,
  });

  factory CitizenDashboardStatsModel.fromJson(Map<String, dynamic> json) {
    return CitizenDashboardStatsModel(
      totalSubmitted:
          json['total_submitted'] as int? ?? json['total'] as int? ?? 0,
      totalResolved:
          json['total_resolved'] as int? ?? json['resolved'] as int? ?? 0,
      totalInProgress:
          json['total_in_progress'] as int? ?? json['in_progress'] as int? ?? 0,
      totalUpvotesGiven:
          json['total_upvotes_given'] as int? ?? json['upvotes'] as int? ?? 0,
      impactPoints:
          json['impact_points'] as int? ?? json['points'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'total_submitted': totalSubmitted,
      'total_resolved': totalResolved,
      'total_in_progress': totalInProgress,
      'total_upvotes_given': totalUpvotesGiven,
      'impact_points': impactPoints,
    };
  }
}
