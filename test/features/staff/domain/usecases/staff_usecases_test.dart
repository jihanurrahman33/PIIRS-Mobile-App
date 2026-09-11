import 'package:flutter_test/flutter_test.dart';
import 'package:zapshift/core/errors/failures.dart';
import 'package:zapshift/features/issues/domain/entities/issue_entity.dart';
import 'package:zapshift/features/staff/domain/entities/staff_dashboard_stats_entity.dart';
import 'package:zapshift/features/staff/domain/repositories/staff_repository.dart';
import 'package:zapshift/features/staff/domain/usecases/get_staff_assigned_tasks_usecase.dart';
import 'package:zapshift/features/staff/domain/usecases/get_staff_dashboard_stats_usecase.dart';
import 'package:zapshift/features/staff/domain/usecases/update_issue_status_usecase.dart';

class FakeStaffRepository implements StaffRepository {
  @override
  Future<(Failure?, List<IssueEntity>?)> getAssignedTasks(
    String staffEmail, {
    bool todayOnly = false,
  }) async => (
    null,
    [
      IssueEntity(
        id: 'task_1',
        title: 'Broken Signal',
        description: 'Intersection light broken',
        category: 'Traffic',
        status: 'staff-assigned',
        upvotes: 4,
        authorEmail: 'citizen@piirs.org',
        createdAt: DateTime.now(),
      ),
    ],
  );

  @override
  Future<(Failure?, bool)> updateIssueStatus({
    required String issueId,
    required String status,
  }) async => (null, true);

  @override
  Future<(Failure?, StaffDashboardStatsEntity?)> getStaffDashboardStats(
    String email,
  ) async => (
    null,
    const StaffDashboardStatsEntity(
      assignedCount: 5,
      resolvedCount: 12,
      openCount: 5,
      assignedToYou: 5,
      avgResponseHours: '2.4',
    ),
  );
}

void main() {
  late FakeStaffRepository repository;
  late GetStaffAssignedTasksUseCase getStaffAssignedTasksUseCase;
  late UpdateIssueStatusUseCase updateIssueStatusUseCase;
  late GetStaffDashboardStatsUseCase getStaffDashboardStatsUseCase;

  setUp(() {
    repository = FakeStaffRepository();
    getStaffAssignedTasksUseCase = GetStaffAssignedTasksUseCase(repository);
    updateIssueStatusUseCase = UpdateIssueStatusUseCase(repository);
    getStaffDashboardStatsUseCase = GetStaffDashboardStatsUseCase(repository);
  });

  group('Staff Domain UseCases Unit Tests', () {
    test('GetStaffAssignedTasksUseCase returns assigned issues list', () async {
      final (failure, tasks) = await getStaffAssignedTasksUseCase(
        'staff@piirs.gov',
      );
      expect(failure, isNull);
      expect(tasks?.length, 1);
      expect(tasks?.first.title, 'Broken Signal');
    });

    test(
      'UpdateIssueStatusUseCase updates status to in-progress or resolved',
      () async {
        final (failure, success) = await updateIssueStatusUseCase(
          issueId: 'task_1',
          status: 'resolved',
        );
        expect(failure, isNull);
        expect(success, isTrue);
      },
    );

    test('GetStaffDashboardStatsUseCase fetches performance metrics', () async {
      final (failure, stats) = await getStaffDashboardStatsUseCase(
        'staff@piirs.gov',
      );
      expect(failure, isNull);
      expect(stats?.resolvedCount, 12);
      expect(stats?.avgResponseHours, '2.4');
    });
  });
}
