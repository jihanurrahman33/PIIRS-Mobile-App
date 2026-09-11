import '../../../../core/errors/failures.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/network/network_info.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../../../issues/domain/entities/issue_entity.dart';
import '../../domain/entities/add_staff_params.dart';
import '../../domain/entities/admin_dashboard_stats_entity.dart';
import '../../domain/repositories/admin_repository.dart';
import '../datasources/admin_remote_datasource.dart';

/// Concrete implementation of AdminRepository bridging network and domain.
class AdminRepositoryImpl implements AdminRepository {
  final AdminRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  const AdminRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  Future<(Failure?, T?)> _execute<T>(Future<T> Function() call) async {
    if (!await networkInfo.isConnected) {
      return (const NetworkFailure('No internet connection'), null);
    }
    try {
      return (null, await call());
    } on AppException catch (e) {
      return (ServerFailure(e.message, e.statusCode), null);
    } catch (e) {
      return (ServerFailure('Admin API error: $e'), null);
    }
  }

  Future<(Failure?, bool)> _execBool(Future<bool> Function() fn) async {
    final (f, res) = await _execute(fn);
    return (f, res ?? false);
  }

  @override
  Future<(Failure?, List<UserEntity>?)> getUsers({int? limit, String? sort}) =>
      _execute(() => remoteDataSource.getUsers(limit: limit, sort: sort));

  @override
  Future<(Failure?, bool)> toggleBlockUser({
    required String userId,
    required bool isBlocked,
  }) => _execBool(
    () =>
        remoteDataSource.toggleBlockUser(userId: userId, isBlocked: isBlocked),
  );

  @override
  Future<(Failure?, List<UserEntity>?)> getStaffs(String role) =>
      _execute(() => remoteDataSource.getStaffs(role));

  @override
  Future<(Failure?, bool)> addStaff(AddStaffParams params) =>
      _execBool(() => remoteDataSource.addStaff(params));

  @override
  Future<(Failure?, List<IssueEntity>?)> getAllAdminIssues() =>
      _execute(() => remoteDataSource.getAllAdminIssues());

  @override
  Future<(Failure?, bool)> assignIssue({
    required String issueId,
    required String staffEmail,
  }) => _execBool(
    () =>
        remoteDataSource.assignIssue(issueId: issueId, staffEmail: staffEmail),
  );

  @override
  Future<(Failure?, AdminDashboardStatsEntity?)> getAdminDashboardStats() =>
      _execute(() => remoteDataSource.getAdminDashboardStats());
}
