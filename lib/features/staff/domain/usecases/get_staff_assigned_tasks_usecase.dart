import '../../../../core/errors/failures.dart';
import '../../../issues/domain/entities/issue_entity.dart';
import '../repositories/staff_repository.dart';

/// UseCase to retrieve tasks assigned to a specific staff member.
class GetStaffAssignedTasksUseCase {
  final StaffRepository repository;

  const GetStaffAssignedTasksUseCase(this.repository);

  Future<(Failure?, List<IssueEntity>?)> call(
    String staffEmail, {
    bool todayOnly = false,
  }) => repository.getAssignedTasks(staffEmail, todayOnly: todayOnly);
}
