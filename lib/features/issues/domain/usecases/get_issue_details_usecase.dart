import '../../../../core/errors/failures.dart';
import '../entities/issue_entity.dart';
import '../repositories/issue_repository.dart';

/// Single-purpose UseCase for fetching detailed issue data by ID.
class GetIssueDetailsUseCase {
  final IssueRepository repository;

  const GetIssueDetailsUseCase(this.repository);

  Future<(Failure?, IssueEntity?)> call(String issueId) {
    return repository.getIssueDetails(issueId);
  }
}
