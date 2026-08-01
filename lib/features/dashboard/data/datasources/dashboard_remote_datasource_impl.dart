import '../../../../core/constants/api_constants.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/network/api_client.dart';
import '../models/citizen_dashboard_stats_model.dart';
import 'dashboard_remote_datasource.dart';

/// Concrete implementation of DashboardRemoteDataSource using ApiClient.
class DashboardRemoteDataSourceImpl implements DashboardRemoteDataSource {
  final ApiClient apiClient;

  const DashboardRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<CitizenDashboardStatsModel> getCitizenStats(String email) async {
    try {
      final response =
          await apiClient.get(ApiConstants.citizenDashboardStats(email));
      return CitizenDashboardStatsModel.fromJson(
          response as Map<String, dynamic>);
    } catch (e) {
      throw ServerException('Failed to fetch citizen dashboard stats: $e');
    }
  }
}
