import '../../../../core/constants/api_constants.dart';
import '../../../../core/network/api_client.dart';
import '../../../auth/data/datasources/user_list_parser.dart';
import '../../../auth/data/models/user_model.dart';
import '../../../issues/data/datasources/issue_list_parser.dart';
import '../../../issues/data/models/issue_model.dart';
import '../../domain/entities/add_staff_params.dart';
import '../models/admin_dashboard_stats_model.dart';
import 'admin_remote_datasource.dart';

/// Concrete implementation of AdminRemoteDataSource using ApiClient.
class AdminRemoteDataSourceImpl implements AdminRemoteDataSource {
  final ApiClient apiClient;

  const AdminRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<List<UserModel>> getUsers({int? limit, String? sort}) async {
    final q = {
      if (limit != null) 'limit': limit,
      if (sort != null) 'sort': sort,
    };
    return UserListParser.parse(
      await apiClient.get(ApiConstants.users, queryParameters: q),
    );
  }

  @override
  Future<bool> toggleBlockUser({
    required String userId,
    required bool isBlocked,
  }) async {
    final res = await apiClient.patch(
      ApiConstants.blockUser(userId),
      body: {'isBlcoked': isBlocked},
    );
    return res is Map &&
        (res['acknowledged'] == true || res['modifiedCount'] == 1);
  }

  @override
  Future<List<UserModel>> getStaffs(String role) async =>
      UserListParser.parse(await apiClient.get(ApiConstants.getStaffs(role)));

  @override
  Future<bool> addStaff(AddStaffParams params) async {
    final res = await apiClient.post(
      ApiConstants.addStaff,
      body: params.toJson(),
    );
    return res is Map && res['success'] == true;
  }

  @override
  Future<List<IssueModel>> getAllAdminIssues() async =>
      IssueListParser.parse(await apiClient.get(ApiConstants.allAdminIssues));

  @override
  Future<bool> assignIssue({
    required String issueId,
    required String staffEmail,
  }) async {
    final res = await apiClient.post(
      ApiConstants.assignIssue(issueId),
      body: {'staffEmail': staffEmail},
    );
    return res is Map && res['success'] == true;
  }

  @override
  Future<AdminDashboardStatsModel> getAdminDashboardStats() async =>
      AdminDashboardStatsModel.fromJson(
        await apiClient.get(ApiConstants.adminDashboardStats)
            as Map<String, dynamic>,
      );
}
