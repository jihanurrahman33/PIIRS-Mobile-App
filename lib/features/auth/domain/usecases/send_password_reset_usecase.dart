import '../../../../core/errors/failures.dart';
import '../repositories/auth_repository.dart';

/// Single-purpose UseCase for requesting a password reset email.
class SendPasswordResetUseCase {
  final AuthRepository repository;

  const SendPasswordResetUseCase(this.repository);

  Future<(Failure?, void)> call(String email) {
    return repository.sendPasswordReset(email);
  }
}
