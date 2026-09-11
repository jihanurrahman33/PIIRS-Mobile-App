import '../models/issue_model.dart';

/// Abstract remote data source contract for Issue API calls.
abstract class IssueRemoteDataSource {
  Future<List<IssueModel>> getIssues({
    int? limit,
    String? sort,
    Map<String, dynamic>? filters,
  });
  Future<List<IssueModel>> getAllIssues();
  Future<IssueModel> getIssueDetails(String issueId);
  Future<IssueModel> createIssue(IssueModel issueModel);
  Future<IssueModel> upvoteIssue(String issueId);
  Future<List<IssueModel>> getMyIssues([String? email]);
  Future<List<IssueModel>> getUserIssues(String email, {int? limit});
}
