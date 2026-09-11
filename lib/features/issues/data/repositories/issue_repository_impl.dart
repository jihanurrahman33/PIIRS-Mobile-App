import '../../../../core/errors/failures.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/issue_entity.dart';
import '../../domain/repositories/issue_repository.dart';
import '../datasources/issue_remote_datasource.dart';
import '../models/issue_model.dart';

/// Concrete implementation of IssueRepository bridging data sources & domain layer.
class IssueRepositoryImpl implements IssueRepository {
  final IssueRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  const IssueRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  Future<(Failure?, T?)> _execute<T>(Future<T> Function() call) async {
    if (!await networkInfo.isConnected) {
      return (const NetworkFailure('No internet connection'), null);
    }
    try {
      final res = await call();
      return (null, res);
    } on AppException catch (e) {
      return (ServerFailure(e.message, e.statusCode), null);
    } catch (e) {
      return (ServerFailure('Unexpected error: $e'), null);
    }
  }

  @override
  Future<(Failure?, List<IssueEntity>?)> getIssues() =>
      _execute(() => remoteDataSource.getIssues());

  @override
  Future<(Failure?, List<IssueEntity>?)> getFilteredIssues({
    int? limit,
    String? sort,
    Map<String, dynamic>? filters,
  }) => _execute(
    () =>
        remoteDataSource.getIssues(limit: limit, sort: sort, filters: filters),
  );

  @override
  Future<(Failure?, List<IssueEntity>?)> getAllIssues() =>
      _execute(() => remoteDataSource.getAllIssues());

  @override
  Future<(Failure?, IssueEntity?)> getIssueDetails(String issueId) =>
      _execute(() => remoteDataSource.getIssueDetails(issueId));

  @override
  Future<(Failure?, IssueEntity?)> createIssue(IssueEntity issue) => _execute(
    () => remoteDataSource.createIssue(IssueModel.fromEntity(issue)),
  );

  @override
  Future<(Failure?, IssueEntity?)> upvoteIssue(String issueId) =>
      _execute(() => remoteDataSource.upvoteIssue(issueId));

  @override
  Future<(Failure?, List<IssueEntity>?)> getMyIssues(String email) =>
      _execute(() => remoteDataSource.getMyIssues(email));

  @override
  Future<(Failure?, List<IssueEntity>?)> getUserIssues(
    String email, {
    int? limit,
  }) => _execute(() => remoteDataSource.getUserIssues(email, limit: limit));
}
