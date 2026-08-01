import '../models/citizen_dashboard_stats_model.dart';

/// Abstract remote data source contract for dashboard stats API requests.
abstract class DashboardRemoteDataSource {
  Future<CitizenDashboardStatsModel> getCitizenStats(String email);
}
