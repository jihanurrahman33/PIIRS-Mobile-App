import '../../../../core/errors/failures.dart';
import '../repositories/auth_repository.dart';

/// UseCase to sync user profile with backend database upon sign in.
class SyncUserProfileUseCase {
  final AuthRepository repository;

  const SyncUserProfileUseCase(this.repository);

  Future<(Failure?, void)> call({required String name, String? photoUrl}) {
    return repository.syncUserProfile(name: name, photoUrl: photoUrl);
  }
}
