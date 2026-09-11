import '../../../auth/data/models/user_model.dart';
import '../../../issues/data/models/issue_model.dart';
import '../../domain/entities/add_staff_params.dart';
import '../models/admin_dashboard_stats_model.dart';

/// Remote data source contract for administrator API operations.
abstract class AdminRemoteDataSource {
  Future<List<UserModel>> getUsers({int? limit, String? sort});

  Future<bool> toggleBlockUser({
    required String userId,
    required bool isBlocked,
  });

  Future<List<UserModel>> getStaffs(String role);

  Future<bool> addStaff(AddStaffParams params);

  Future<List<IssueModel>> getAllAdminIssues();

  Future<bool> assignIssue({
    required String issueId,
    required String staffEmail,
  });

  Future<AdminDashboardStatsModel> getAdminDashboardStats();
}
