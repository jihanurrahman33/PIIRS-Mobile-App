import '../../../../core/errors/failures.dart';
import '../repositories/auth_repository.dart';

/// Single-purpose UseCase for logging out an authenticated session.
class LogoutUseCase {
  final AuthRepository repository;

  const LogoutUseCase(this.repository);

  Future<(Failure?, void)> call() {
    return repository.logout();
  }
}
