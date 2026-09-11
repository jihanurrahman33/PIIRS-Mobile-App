import '../../../../core/errors/failures.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

/// UseCase to fetch full user profile information by email.
class GetUserProfileUseCase {
  final AuthRepository repository;

  const GetUserProfileUseCase(this.repository);

  Future<(Failure?, UserEntity?)> call(String email) {
    return repository.getUserProfile(email);
  }
}
