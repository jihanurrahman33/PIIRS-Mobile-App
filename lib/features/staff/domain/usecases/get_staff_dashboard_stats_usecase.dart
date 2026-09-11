import '../../../../core/errors/failures.dart';
import '../entities/staff_dashboard_stats_entity.dart';
import '../repositories/staff_repository.dart';

/// UseCase to fetch staff dashboard performance analytics.
class GetStaffDashboardStatsUseCase {
  final StaffRepository repository;

  const GetStaffDashboardStatsUseCase(this.repository);

  Future<(Failure?, StaffDashboardStatsEntity?)> call(String email) =>
      repository.getStaffDashboardStats(email);
}
