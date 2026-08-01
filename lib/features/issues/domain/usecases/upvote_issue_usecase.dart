import '../../../../core/errors/failures.dart';
import '../entities/issue_entity.dart';
import '../repositories/issue_repository.dart';

/// Single-purpose UseCase for upvoting a community issue.
class UpvoteIssueUseCase {
  final IssueRepository repository;

  const UpvoteIssueUseCase(this.repository);

  Future<(Failure?, IssueEntity?)> call(String issueId) {
    return repository.upvoteIssue(issueId);
  }
}
