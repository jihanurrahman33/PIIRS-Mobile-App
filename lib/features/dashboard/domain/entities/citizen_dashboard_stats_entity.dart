import 'package:equatable/equatable.dart';

/// Pure domain entity holding citizen dashboard metrics & impact score.
class CitizenDashboardStatsEntity extends Equatable {
  final int totalSubmitted;
  final int totalResolved;
  final int totalInProgress;
  final int totalUpvotesGiven;
  final int impactPoints;

  const CitizenDashboardStatsEntity({
    required this.totalSubmitted,
    required this.totalResolved,
    required this.totalInProgress,
    required this.totalUpvotesGiven,
    required this.impactPoints,
  });

  @override
  List<Object?> get props => [
        totalSubmitted,
        totalResolved,
        totalInProgress,
        totalUpvotesGiven,
        impactPoints,
      ];
}
