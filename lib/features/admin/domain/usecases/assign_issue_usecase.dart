import '../../../../core/errors/failures.dart';
import '../repositories/admin_repository.dart';

/// UseCase to delegate an issue to a specific staff member.
class AssignIssueUseCase {
  final AdminRepository repository;

  const AssignIssueUseCase(this.repository);

  Future<(Failure?, bool)> call({
    required String issueId,
    required String staffEmail,
  }) => repository.assignIssue(issueId: issueId, staffEmail: staffEmail);
}
