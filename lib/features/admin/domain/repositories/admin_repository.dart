import '../../../../core/errors/failures.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../../../issues/domain/entities/issue_entity.dart';
import '../entities/add_staff_params.dart';
import '../entities/admin_dashboard_stats_entity.dart';

/// Abstract domain repository for admin management operations.
abstract class AdminRepository {
  Future<(Failure?, List<UserEntity>?)> getUsers({int? limit, String? sort});

  Future<(Failure?, bool)> toggleBlockUser({
    required String userId,
    required bool isBlocked,
  });

  Future<(Failure?, List<UserEntity>?)> getStaffs(String role);

  Future<(Failure?, bool)> addStaff(AddStaffParams params);

  Future<(Failure?, List<IssueEntity>?)> getAllAdminIssues();

  Future<(Failure?, bool)> assignIssue({
    required String issueId,
    required String staffEmail,
  });

  Future<(Failure?, AdminDashboardStatsEntity?)> getAdminDashboardStats();
}
