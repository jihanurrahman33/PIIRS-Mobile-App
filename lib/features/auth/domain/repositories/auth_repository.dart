import '../../../../core/errors/failures.dart';
import '../entities/user_entity.dart';

/// Domain repository interface defining authentication contracts.
abstract class AuthRepository {
  Future<(Failure?, UserEntity?)> login({
    required String email,
    required String password,
  });

  Future<(Failure?, UserEntity?)> register({
    required String name,
    required String email,
    required String password,
    String role = 'citizen',
  });

  Future<(Failure?, String?)> getUserRole(String email);

  Future<(Failure?, void)> logout();

  Future<(Failure?, void)> sendPasswordReset(String email);

  Future<(Failure?, UserEntity?)> getCurrentUser();
}
