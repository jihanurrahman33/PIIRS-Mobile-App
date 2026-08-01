import '../../../../core/errors/failures.dart';
import '../entities/issue_entity.dart';
import '../repositories/issue_repository.dart';

/// Single-purpose UseCase for fetching public issues.
class GetIssuesUseCase {
  final IssueRepository repository;

  const GetIssuesUseCase(this.repository);

  Future<(Failure?, List<IssueEntity>?)> call() {
    return repository.getIssues();
  }
}
