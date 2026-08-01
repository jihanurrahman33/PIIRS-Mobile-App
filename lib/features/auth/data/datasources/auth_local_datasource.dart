import 'dart:convert';

import '../../../../core/services/secure_storage_service.dart';
import '../models/user_model.dart';

/// Local data source contract for caching tokens and user session data.
abstract class AuthLocalDataSource {
  Future<void> saveAuthToken(String token);
  Future<String?> getAuthToken();
  Future<void> clearAuthToken();
  Future<void> cacheUserProfile(UserModel user);
  Future<UserModel?> getCachedUserProfile();
}

/// Implementation of [AuthLocalDataSource] using [SecureStorageService].
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  static const String _tokenKey = 'jwt_auth_token';
  static const String _userProfileKey = 'cached_user_profile';
  final SecureStorageService storageService;

  AuthLocalDataSourceImpl({required this.storageService});

  @override
  Future<void> saveAuthToken(String token) {
    return storageService.write(key: _tokenKey, value: token);
  }

  @override
  Future<String?> getAuthToken() {
    return storageService.read(key: _tokenKey);
  }

  @override
  Future<void> clearAuthToken() async {
    await storageService.delete(key: _tokenKey);
    await storageService.delete(key: _userProfileKey);
  }

  @override
  Future<void> cacheUserProfile(UserModel user) {
    final jsonStr = jsonEncode(user.toJson());
    return storageService.write(key: _userProfileKey, value: jsonStr);
  }

  @override
  Future<UserModel?> getCachedUserProfile() async {
    final jsonStr = await storageService.read(key: _userProfileKey);
    if (jsonStr == null || jsonStr.isEmpty) return null;
    try {
      final Map<String, dynamic> jsonMap = jsonDecode(jsonStr);
      return UserModel.fromJson(jsonMap);
    } catch (_) {
      return null;
    }
  }
}
