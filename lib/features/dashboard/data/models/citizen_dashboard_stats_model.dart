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
    final sub =
        (json['submittedCount'] ??
                json['total_submitted'] ??
                json['total'] ??
                0)
            as int;
    final res =
        (json['resolvedCount'] ??
                json['total_resolved'] ??
                json['resolved'] ??
                0)
            as int;
    final inProg =
        (json['openCount'] ??
                json['pendingCount'] ??
                json['total_in_progress'] ??
                0)
            as int;
    final upvotes =
        (json['upvotesGiven'] ??
                json['total_upvotes_given'] ??
                json['upvotes'] ??
                0)
            as int;
    final pts =
        (json['impact_points'] ??
                json['points'] ??
                (sub * 20 + res * 50 + upvotes * 5))
            as int;

    return CitizenDashboardStatsModel(
      totalSubmitted: sub,
      totalResolved: res,
      totalInProgress: inProg,
      totalUpvotesGiven: upvotes,
      impactPoints: pts,
    );
  }

  Map<String, dynamic> toJson() => {
    'total_submitted': totalSubmitted,
    'total_resolved': totalResolved,
    'total_in_progress': totalInProgress,
    'total_upvotes_given': totalUpvotesGiven,
    'impact_points': impactPoints,
  };
}
