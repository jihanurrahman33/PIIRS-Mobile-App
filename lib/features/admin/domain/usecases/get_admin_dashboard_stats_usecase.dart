import '../../../../core/errors/failures.dart';
import '../entities/admin_dashboard_stats_entity.dart';
import '../repositories/admin_repository.dart';

/// UseCase to retrieve system-wide administrative statistics and analytics.
class GetAdminDashboardStatsUseCase {
  final AdminRepository repository;

  const GetAdminDashboardStatsUseCase(this.repository);

  Future<(Failure?, AdminDashboardStatsEntity?)> call() =>
      repository.getAdminDashboardStats();
}
