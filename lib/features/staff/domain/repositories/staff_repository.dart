import '../../../../core/errors/failures.dart';
import '../../../issues/domain/entities/issue_entity.dart';
import '../entities/staff_dashboard_stats_entity.dart';

/// Abstract domain repository for staff task operations.
abstract class StaffRepository {
  Future<(Failure?, List<IssueEntity>?)> getAssignedTasks(
    String staffEmail, {
    bool todayOnly = false,
  });

  Future<(Failure?, bool)> updateIssueStatus({
    required String issueId,
    required String status,
  });

  Future<(Failure?, StaffDashboardStatsEntity?)> getStaffDashboardStats(
    String email,
  );
}
