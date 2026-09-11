import '../../../../core/errors/failures.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../repositories/admin_repository.dart';

/// UseCase to retrieve system users with optional limit and sort.
class GetAllUsersUseCase {
  final AdminRepository repository;

  const GetAllUsersUseCase(this.repository);

  Future<(Failure?, List<UserEntity>?)> call({int? limit, String? sort}) =>
      repository.getUsers(limit: limit, sort: sort);
}
