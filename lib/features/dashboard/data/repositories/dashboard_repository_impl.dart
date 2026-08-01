import '../../../../core/errors/failures.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/citizen_dashboard_stats_entity.dart';
import '../../domain/repositories/dashboard_repository.dart';
import '../datasources/dashboard_remote_datasource.dart';

/// Concrete implementation of DashboardRepository bridging data & domain layers.
class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  const DashboardRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<(Failure?, CitizenDashboardStatsEntity?)> getCitizenStats(
      String email) async {
    if (!await networkInfo.isConnected) {
      return (const NetworkFailure('No internet connection'), null);
    }
    try {
      final model = await remoteDataSource.getCitizenStats(email);
      return (null, model);
    } on ServerException catch (e) {
      return (ServerFailure(e.message), null);
    } catch (e) {
      return (ServerFailure('Unexpected error: $e'), null);
    }
  }
}
