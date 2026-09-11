import '../../../../core/constants/api_constants.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/network/api_client.dart';
import '../models/user_model.dart';
import 'auth_remote_datasource.dart';

/// Implementation of [AuthRemoteDataSource] using [ApiClient].
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient apiClient;

  AuthRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    final res = await apiClient.get(
      ApiConstants.userRole(email),
      requiresAuth: false,
    );
    if (res is Map<String, dynamic> && res.isNotEmpty) {
      final user = UserModel.fromJson(res);
      if (user.isBlocked) {
        throw const UnauthorizedException('Account blocked by administrator.');
      }
      return user;
    }
    throw const UnauthorizedException('Invalid email or password.');
  }

  @override
  Future<UserModel> register({
    required String name,
    required String email,
    required String password,
    String role = 'citizen',
  }) async {
    final check = await apiClient.get(
      ApiConstants.userRole(email),
      requiresAuth: false,
    );
    if (check is Map<String, dynamic> && check.isNotEmpty) {
      throw const BadRequestException('Email is already registered.');
    }
    return UserModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      email: email,
      role: role,
    );
  }

  @override
  Future<String> getUserRole(String email) async {
    final res = await apiClient.get(ApiConstants.userRole(email));
    return res is Map && res.containsKey('role')
        ? res['role'].toString()
        : 'citizen';
  }

  @override
  Future<UserModel?> getUserProfile(String email) async {
    final res = await apiClient.get(ApiConstants.userRole(email));
    return res is Map<String, dynamic> ? UserModel.fromJson(res) : null;
  }

  @override
  Future<void> syncUserProfile({
    required String name,
    String? photoUrl,
  }) async => apiClient.post(
    ApiConstants.users,
    body: {'name': name, if (photoUrl != null) 'photoURL': photoUrl},
  );

  @override
  Future<void> sendPasswordReset(String email) async =>
      apiClient.post('/users/reset-password', body: {'email': email});
}
