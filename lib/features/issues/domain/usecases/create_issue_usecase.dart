import '../../../../core/errors/failures.dart';
import '../entities/issue_entity.dart';
import '../repositories/issue_repository.dart';

/// Single-purpose UseCase for submitting a new issue report.
class CreateIssueUseCase {
  final IssueRepository repository;

  const CreateIssueUseCase(this.repository);

  Future<(Failure?, IssueEntity?)> call(IssueEntity issue) {
    return repository.createIssue(issue);
  }
}
