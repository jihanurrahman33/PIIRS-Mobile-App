import '../models/issue_model.dart';

/// Helper utility parsing dynamic JSON list into typed IssueModel lists.
abstract class IssueListParser {
  static List<IssueModel> parse(dynamic res) {
    if (res is List) {
      return res
          .map((j) => IssueModel.fromJson(j as Map<String, dynamic>))
          .toList();
    }
    return [];
  }

  static IssueModel upvoteModel(String id, int count) => IssueModel(
    id: id,
    title: '',
    description: '',
    category: 'General',
    status: 'Pending',
    upvotes: count,
    authorEmail: '',
    createdAt: DateTime.now(),
  );
}
