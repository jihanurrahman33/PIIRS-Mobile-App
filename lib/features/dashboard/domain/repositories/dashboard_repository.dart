import '../../../../core/errors/failures.dart';
import '../entities/citizen_dashboard_stats_entity.dart';

/// Abstract domain repository contract for fetching dashboard statistics.
abstract class DashboardRepository {
  Future<(Failure?, CitizenDashboardStatsEntity?)> getCitizenStats(
      String email);
}
