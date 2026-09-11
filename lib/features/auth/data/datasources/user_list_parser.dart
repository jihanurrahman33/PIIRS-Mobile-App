import '../models/user_model.dart';

/// Helper utility parsing dynamic JSON list into typed UserModel lists.
abstract class UserListParser {
  static List<UserModel> parse(dynamic res) {
    if (res is List) {
      return res
          .map((j) => UserModel.fromJson(j as Map<String, dynamic>))
          .toList();
    }
    return [];
  }
}
