import '../../../../core/constants/api_constants.dart';
import '../../../../core/network/api_client.dart';
import '../models/issue_model.dart';
import 'issue_list_parser.dart';
import 'issue_remote_datasource.dart';

/// Concrete implementation of IssueRemoteDataSource using ApiClient.
class IssueRemoteDataSourceImpl implements IssueRemoteDataSource {
  final ApiClient apiClient;

  const IssueRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<List<IssueModel>> getIssues({
    int? limit,
    String? sort,
    Map<String, dynamic>? filters,
  }) async {
    final params = <String, dynamic>{
      if (limit != null) 'limit': limit,
      if (sort != null) 'sort': sort,
      if (filters != null) ...filters,
    };
    final res = await apiClient.get(
      ApiConstants.issues,
      queryParameters: params,
      requiresAuth: false,
    );
    return IssueListParser.parse(res);
  }

  @override
  Future<List<IssueModel>> getAllIssues() async => IssueListParser.parse(
    await apiClient.get(ApiConstants.allIssues, requiresAuth: false),
  );

  @override
  Future<IssueModel> getIssueDetails(String id) async => IssueModel.fromJson(
    await apiClient.get(ApiConstants.issueDetails(id), requiresAuth: false)
        as Map<String, dynamic>,
  );

  @override
  Future<IssueModel> createIssue(IssueModel issue) async => IssueModel.fromJson(
    await apiClient.post(ApiConstants.issues, body: issue.toJson())
        as Map<String, dynamic>,
  );

  @override
  Future<IssueModel> upvoteIssue(String id) async {
    final res = await apiClient.patch(ApiConstants.upvoteIssue(id));
    final count = res is Map ? (res['upvotes'] as num?)?.toInt() ?? 0 : 0;
    return IssueListParser.upvoteModel(id, count);
  }

  @override
  Future<List<IssueModel>> getMyIssues([String? email]) async {
    final path = email != null
        ? ApiConstants.userIssues(email)
        : ApiConstants.myIssues;
    return IssueListParser.parse(await apiClient.get(path));
  }

  @override
  Future<List<IssueModel>> getUserIssues(String email, {int? limit}) async {
    final q = limit != null ? {'limit': limit} : null;
    return IssueListParser.parse(
      await apiClient.get(ApiConstants.userIssues(email), queryParameters: q),
    );
  }
}
