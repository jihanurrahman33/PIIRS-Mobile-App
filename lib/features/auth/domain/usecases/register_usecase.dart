import '../../../../core/errors/failures.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

/// Single-purpose UseCase for registering a new citizen account.
class RegisterUseCase {
  final AuthRepository repository;

  const RegisterUseCase(this.repository);

  Future<(Failure?, UserEntity?)> call({
    required String name,
    required String email,
    required String password,
    String role = 'citizen',
  }) {
    return repository.register(
      name: name,
      email: email,
      password: password,
      role: role,
    );
  }
}
