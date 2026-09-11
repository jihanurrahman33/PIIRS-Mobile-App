import '../../../../core/errors/failures.dart';
import '../entities/issue_entity.dart';
import '../repositories/issue_repository.dart';

/// UseCase to fetch issues submitted by a specific user email.
class GetUserIssuesUseCase {
  final IssueRepository repository;

  const GetUserIssuesUseCase(this.repository);

  Future<(Failure?, List<IssueEntity>?)> call(String email, {int? limit}) =>
      repository.getUserIssues(email, limit: limit);
}
