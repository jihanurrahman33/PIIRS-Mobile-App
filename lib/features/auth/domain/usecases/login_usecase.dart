import '../../../../core/errors/failures.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

/// Single-purpose UseCase for executing user login.
class LoginUseCase {
  final AuthRepository repository;

  const LoginUseCase(this.repository);

  Future<(Failure?, UserEntity?)> call({
    required String email,
    required String password,
  }) {
    return repository.login(email: email, password: password);
  }
}
