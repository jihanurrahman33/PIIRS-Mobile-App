import '../../../../core/errors/failures.dart';
import '../entities/issue_entity.dart';
import '../repositories/issue_repository.dart';

/// UseCase to retrieve authenticated user's submitted issues.
class GetMyIssuesUseCase {
  final IssueRepository repository;

  const GetMyIssuesUseCase(this.repository);

  Future<(Failure?, List<IssueEntity>?)> call(String email) =>
      repository.getMyIssues(email);
}
