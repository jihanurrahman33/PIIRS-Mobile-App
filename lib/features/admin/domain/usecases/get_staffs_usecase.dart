import '../../../../core/errors/failures.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../repositories/admin_repository.dart';

/// UseCase to fetch staff members filtered by role.
class GetStaffsUseCase {
  final AdminRepository repository;

  const GetStaffsUseCase(this.repository);

  Future<(Failure?, List<UserEntity>?)> call(String role) =>
      repository.getStaffs(role);
}
