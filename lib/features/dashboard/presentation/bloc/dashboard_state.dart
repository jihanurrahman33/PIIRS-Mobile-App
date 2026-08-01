import 'package:equatable/equatable.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/entities/citizen_dashboard_stats_entity.dart';

/// Base state class for DashboardBloc.
abstract class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object?> get props => [];
}

/// Initial state of DashboardBloc.
class DashboardInitialState extends DashboardState {
  const DashboardInitialState();
}

/// Loading state during async dashboard operations.
class DashboardLoadingState extends DashboardState {
  const DashboardLoadingState();
}

/// State emitted when citizen dashboard stats are loaded.
class CitizenDashboardStatsLoadedState extends DashboardState {
  final CitizenDashboardStatsEntity stats;

  const CitizenDashboardStatsLoadedState(this.stats);

  @override
  List<Object?> get props => [stats];
}

/// State emitted when dashboard operations fail.
class DashboardFailureState extends DashboardState {
  final Failure failure;

  const DashboardFailureState(this.failure);

  @override
  List<Object?> get props => [failure];
}
