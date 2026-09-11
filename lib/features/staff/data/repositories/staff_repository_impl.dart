import '../../../../core/errors/failures.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/network/network_info.dart';
import '../../../issues/domain/entities/issue_entity.dart';
import '../../domain/entities/staff_dashboard_stats_entity.dart';
import '../../domain/repositories/staff_repository.dart';
import '../datasources/staff_remote_datasource.dart';

/// Concrete implementation of StaffRepository bridging API and domain.
class StaffRepositoryImpl implements StaffRepository {
  final StaffRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  const StaffRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<(Failure?, List<IssueEntity>?)> getAssignedTasks(
    String staffEmail, {
    bool todayOnly = false,
  }) async {
    if (!await networkInfo.isConnected) {
      return (const NetworkFailure('No internet connection'), null);
    }
    try {
      final tasks = await remoteDataSource.getAssignedTasks(
        staffEmail,
        todayOnly: todayOnly,
      );
      return (null, tasks);
    } on AppException catch (e) {
      return (ServerFailure(e.message, e.statusCode), null);
    } catch (e) {
      return (ServerFailure('Error fetching staff tasks: $e'), null);
    }
  }

  @override
  Future<(Failure?, bool)> updateIssueStatus({
    required String issueId,
    required String status,
  }) async {
    if (!await networkInfo.isConnected) {
      return (const NetworkFailure('No internet connection'), false);
    }
    try {
      final success = await remoteDataSource.updateIssueStatus(
        issueId: issueId,
        status: status,
      );
      return (null, success);
    } on AppException catch (e) {
      return (ServerFailure(e.message, e.statusCode), false);
    } catch (e) {
      return (ServerFailure('Error updating issue status: $e'), false);
    }
  }

  @override
  Future<(Failure?, StaffDashboardStatsEntity?)> getStaffDashboardStats(
    String email,
  ) async {
    if (!await networkInfo.isConnected) {
      return (const NetworkFailure('No internet connection'), null);
    }
    try {
      final stats = await remoteDataSource.getStaffDashboardStats(email);
      return (null, stats);
    } on AppException catch (e) {
      return (ServerFailure(e.message, e.statusCode), null);
    } catch (e) {
      return (ServerFailure('Error fetching staff stats: $e'), null);
    }
  }
}
