import '../../../../core/errors/failures.dart';
import '../repositories/staff_repository.dart';

/// UseCase for staff to update resolution status of an issue.
class UpdateIssueStatusUseCase {
  final StaffRepository repository;

  const UpdateIssueStatusUseCase(this.repository);

  Future<(Failure?, bool)> call({
    required String issueId,
    required String status,
  }) => repository.updateIssueStatus(issueId: issueId, status: status);
}
