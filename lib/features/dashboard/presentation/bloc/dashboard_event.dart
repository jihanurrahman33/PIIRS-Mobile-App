import 'package:equatable/equatable.dart';

/// Base event class for DashboardBloc.
abstract class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object?> get props => [];
}

/// Event triggered to load citizen dashboard statistics.
class FetchCitizenDashboardStatsEvent extends DashboardEvent {
  final String email;

  const FetchCitizenDashboardStatsEvent(this.email);

  @override
  List<Object?> get props => [email];
}
