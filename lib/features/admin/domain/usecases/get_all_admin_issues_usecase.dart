import '../../../../core/errors/failures.dart';
import '../../../issues/domain/entities/issue_entity.dart';
import '../repositories/admin_repository.dart';

/// UseCase to fetch all issues in the system for admin triage.
class GetAllAdminIssuesUseCase {
  final AdminRepository repository;

  const GetAllAdminIssuesUseCase(this.repository);

  Future<(Failure?, List<IssueEntity>?)> call() =>
      repository.getAllAdminIssues();
}
