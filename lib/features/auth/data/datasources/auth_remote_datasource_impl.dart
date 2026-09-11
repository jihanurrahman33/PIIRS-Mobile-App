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
    final response = await apiClient.post(
      ApiConstants.users,
      body: {'email': email, 'password': password},
    );
    if (response is Map<String, dynamic>) {
      return UserModel.fromJson(response);
    }
    throw const ServerException('Invalid login response format.');
  }

  @override
  Future<UserModel> register({
    required String name,
    required String email,
    required String password,
    String role = 'citizen',
  }) async {
    final response = await apiClient.post(
      ApiConstants.users,
      body: {'name': name, 'email': email, 'password': password, 'role': role},
    );
    if (response is Map<String, dynamic>) {
      return UserModel.fromJson(response);
    }
    throw const ServerException('Invalid registration response format.');
  }

  @override
  Future<String> getUserRole(String email) async {
    final response = await apiClient.get(ApiConstants.userRole(email));
    if (response is Map<String, dynamic> && response.containsKey('role')) {
      return response['role'].toString();
    }
    return 'citizen';
  }

  @override
  Future<UserModel?> getUserProfile(String email) async {
    final response = await apiClient.get(ApiConstants.userRole(email));
    if (response is Map<String, dynamic>) {
      return UserModel.fromJson(response);
    }
    return null;
  }

  @override
  Future<void> syncUserProfile({required String name, String? photoUrl}) async {
    await apiClient.post(
      ApiConstants.users,
      body: {'name': name, if (photoUrl != null) 'photoURL': photoUrl},
    );
  }

  @override
  Future<void> sendPasswordReset(String email) async {
    await apiClient.post('/users/reset-password', body: {'email': email});
  }
}
