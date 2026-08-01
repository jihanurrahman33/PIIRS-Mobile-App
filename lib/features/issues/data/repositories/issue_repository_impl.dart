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

  @override
  Future<(Failure?, List<IssueEntity>?)> getIssues() async {
    if (!await networkInfo.isConnected) {
      return (const NetworkFailure('No internet connection'), null);
    }
    try {
      final models = await remoteDataSource.getIssues();
      return (null, models);
    } on ServerException catch (e) {
      return (ServerFailure(e.message), null);
    } catch (e) {
      return (ServerFailure('Unexpected error: $e'), null);
    }
  }

  @override
  Future<(Failure?, IssueEntity?)> getIssueDetails(String issueId) async {
    if (!await networkInfo.isConnected) {
      return (const NetworkFailure('No internet connection'), null);
    }
    try {
      final model = await remoteDataSource.getIssueDetails(issueId);
      return (null, model);
    } on ServerException catch (e) {
      return (ServerFailure(e.message), null);
    } catch (e) {
      return (ServerFailure('Unexpected error: $e'), null);
    }
  }

  @override
  Future<(Failure?, IssueEntity?)> createIssue(IssueEntity issue) async {
    if (!await networkInfo.isConnected) {
      return (const NetworkFailure('No internet connection'), null);
    }
    try {
      final model = IssueModel.fromEntity(issue);
      final createdModel = await remoteDataSource.createIssue(model);
      return (null, createdModel);
    } on ServerException catch (e) {
      return (ServerFailure(e.message), null);
    } catch (e) {
      return (ServerFailure('Unexpected error: $e'), null);
    }
  }

  @override
  Future<(Failure?, IssueEntity?)> upvoteIssue(String issueId) async {
    if (!await networkInfo.isConnected) {
      return (const NetworkFailure('No internet connection'), null);
    }
    try {
      final model = await remoteDataSource.upvoteIssue(issueId);
      return (null, model);
    } on ServerException catch (e) {
      return (ServerFailure(e.message), null);
    } catch (e) {
      return (ServerFailure('Unexpected error: $e'), null);
    }
  }

  @override
  Future<(Failure?, List<IssueEntity>?)> getMyIssues(String email) async {
    if (!await networkInfo.isConnected) {
      return (const NetworkFailure('No internet connection'), null);
    }
    try {
      final models = await remoteDataSource.getMyIssues(email);
      return (null, models);
    } on ServerException catch (e) {
      return (ServerFailure(e.message), null);
    } catch (e) {
      return (ServerFailure('Unexpected error: $e'), null);
    }
  }
}
