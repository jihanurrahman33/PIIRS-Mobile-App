import '../../../../core/constants/api_constants.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/network/api_client.dart';
import '../../../issues/data/datasources/issue_list_parser.dart';
import '../../../issues/data/models/issue_model.dart';
import '../models/staff_dashboard_stats_model.dart';
import 'staff_remote_datasource.dart';

/// Concrete implementation of StaffRemoteDataSource using ApiClient.
class StaffRemoteDataSourceImpl implements StaffRemoteDataSource {
  final ApiClient apiClient;

  const StaffRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<List<IssueModel>> getAssignedTasks(
    String staffEmail, {
    bool todayOnly = false,
  }) async {
    final query = todayOnly ? {'today': 'true'} : null;
    final res = await apiClient.get(
      ApiConstants.staffAssignedTasks(staffEmail),
      queryParameters: query,
    );
    return IssueListParser.parse(res);
  }

  @override
  Future<bool> updateIssueStatus({
    required String issueId,
    required String status,
  }) async {
    final res = await apiClient.patch(
      ApiConstants.updateIssueStatus(issueId),
      body: {'status': status},
    );
    return res is Map &&
        (res['modifiedCount'] == 1 || res['acknowledged'] == true);
  }

  @override
  Future<StaffDashboardStatsModel> getStaffDashboardStats(String email) async {
    final res = await apiClient.get(ApiConstants.staffDashboardStats(email));
    if (res is Map<String, dynamic>) {
      return StaffDashboardStatsModel.fromJson(res);
    }
    throw const ServerException('Invalid staff stats response.');
  }
}
