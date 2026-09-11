import '../../../../core/errors/failures.dart';
import '../entities/issue_entity.dart';
import '../repositories/issue_repository.dart';

/// UseCase to fetch all issues without filter for public exploration.
class GetAllIssuesUseCase {
  final IssueRepository repository;

  const GetAllIssuesUseCase(this.repository);

  Future<(Failure?, List<IssueEntity>?)> call() => repository.getAllIssues();
}
