import '../../../../core/errors/failures.dart';
import '../repositories/admin_repository.dart';

/// UseCase to block or unblock a citizen or staff user.
class ToggleBlockUserUseCase {
  final AdminRepository repository;

  const ToggleBlockUserUseCase(this.repository);

  Future<(Failure?, bool)> call({
    required String userId,
    required bool isBlocked,
  }) => repository.toggleBlockUser(userId: userId, isBlocked: isBlocked);
}
