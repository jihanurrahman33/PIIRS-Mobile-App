import '../models/user_model.dart';

/// Remote data source contract for authentication API endpoints.
abstract class AuthRemoteDataSource {
  Future<UserModel> login({required String email, required String password});

  Future<UserModel> register({
    required String name,
    required String email,
    required String password,
    String role = 'citizen',
  });

  Future<String> getUserRole(String email);

  Future<UserModel?> getUserProfile(String email);

  Future<void> syncUserProfile({required String name, String? photoUrl});

  Future<void> sendPasswordReset(String email);
}
