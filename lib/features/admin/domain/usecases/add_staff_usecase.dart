import '../../../../core/errors/failures.dart';
import '../entities/add_staff_params.dart';
import '../repositories/admin_repository.dart';

/// UseCase to provision a new staff member credentials and profile.
class AddStaffUseCase {
  final AdminRepository repository;

  const AddStaffUseCase(this.repository);

  Future<(Failure?, bool)> call(AddStaffParams params) =>
      repository.addStaff(params);
}
