import '../../../../core/errors/failures.dart';
import '../entities/citizen_dashboard_stats_entity.dart';
import '../repositories/dashboard_repository.dart';

/// Single-purpose UseCase for fetching citizen dashboard stats.
class GetCitizenDashboardStatsUseCase {
  final DashboardRepository repository;

  const GetCitizenDashboardStatsUseCase(this.repository);

  Future<(Failure?, CitizenDashboardStatsEntity?)> call(String email) {
    return repository.getCitizenStats(email);
  }
}
