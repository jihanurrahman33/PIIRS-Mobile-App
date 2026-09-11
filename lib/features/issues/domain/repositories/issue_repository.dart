import '../../../../core/errors/failures.dart';
import '../entities/issue_entity.dart';

/// Abstract domain repository interface for issue management operations.
abstract class IssueRepository {
  Future<(Failure?, List<IssueEntity>?)> getIssues();

  Future<(Failure?, List<IssueEntity>?)> getFilteredIssues({
    int? limit,
    String? sort,
    Map<String, dynamic>? filters,
  });

  Future<(Failure?, List<IssueEntity>?)> getAllIssues();

  Future<(Failure?, IssueEntity?)> getIssueDetails(String issueId);

  Future<(Failure?, IssueEntity?)> createIssue(IssueEntity issue);

  Future<(Failure?, IssueEntity?)> upvoteIssue(String issueId);

  Future<(Failure?, List<IssueEntity>?)> getMyIssues(String email);

  Future<(Failure?, List<IssueEntity>?)> getUserIssues(
    String email, {
    int? limit,
  });
}
