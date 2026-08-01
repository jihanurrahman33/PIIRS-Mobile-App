import '../../../../core/constants/api_constants.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/network/api_client.dart';
import '../models/issue_model.dart';
import 'issue_remote_datasource.dart';

/// Concrete implementation of IssueRemoteDataSource using ApiClient.
class IssueRemoteDataSourceImpl implements IssueRemoteDataSource {
  final ApiClient apiClient;

  const IssueRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<List<IssueModel>> getIssues() async {
    try {
      final response = await apiClient.get(ApiConstants.issues);
      if (response is List) {
        return response
            .map((json) => IssueModel.fromJson(json as Map<String, dynamic>))
            .toList();
      }
      return [];
    } catch (e) {
      throw ServerException('Failed to fetch issues: $e');
    }
  }

  @override
  Future<IssueModel> getIssueDetails(String issueId) async {
    try {
      final response = await apiClient.get(ApiConstants.issueDetails(issueId));
      return IssueModel.fromJson(response as Map<String, dynamic>);
    } catch (e) {
      throw ServerException('Failed to fetch issue details: $e');
    }
  }

  @override
  Future<IssueModel> createIssue(IssueModel issueModel) async {
    try {
      final response = await apiClient.post(
        ApiConstants.issues,
        body: issueModel.toJson(),
      );
      return IssueModel.fromJson(response as Map<String, dynamic>);
    } catch (e) {
      throw ServerException('Failed to create issue: $e');
    }
  }

  @override
  Future<IssueModel> upvoteIssue(String issueId) async {
    try {
      final response = await apiClient.patch(ApiConstants.upvoteIssue(issueId));
      return IssueModel.fromJson(response as Map<String, dynamic>);
    } catch (e) {
      throw ServerException('Failed to upvote issue: $e');
    }
  }

  @override
  Future<List<IssueModel>> getMyIssues(String email) async {
    try {
      final response = await apiClient.get(ApiConstants.userIssues(email));
      if (response is List) {
        return response
            .map((json) => IssueModel.fromJson(json as Map<String, dynamic>))
            .toList();
      }
      return [];
    } catch (e) {
      throw ServerException('Failed to fetch user issues: $e');
    }
  }
}
