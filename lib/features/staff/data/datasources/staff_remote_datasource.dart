import '../../../issues/data/models/issue_model.dart';
import '../models/staff_dashboard_stats_model.dart';

/// Remote data source contract for staff API operations.
abstract class StaffRemoteDataSource {
  Future<List<IssueModel>> getAssignedTasks(
    String staffEmail, {
    bool todayOnly = false,
  });

  Future<bool> updateIssueStatus({
    required String issueId,
    required String status,
  });

  Future<StaffDashboardStatsModel> getStaffDashboardStats(String email);
}
