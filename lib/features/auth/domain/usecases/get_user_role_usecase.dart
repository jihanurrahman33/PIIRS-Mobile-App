import '../../../../core/errors/failures.dart';
import '../repositories/auth_repository.dart';

/// Single-purpose UseCase for fetching a user's role by email.
class GetUserRoleUseCase {
  final AuthRepository repository;

  const GetUserRoleUseCase(this.repository);

  Future<(Failure?, String?)> call(String email) {
    return repository.getUserRole(email);
  }
}
