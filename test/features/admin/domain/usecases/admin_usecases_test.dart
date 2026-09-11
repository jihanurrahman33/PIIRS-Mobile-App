import 'package:flutter_test/flutter_test.dart';
import 'package:zapshift/core/errors/failures.dart';
import 'package:zapshift/features/admin/domain/entities/add_staff_params.dart';
import 'package:zapshift/features/admin/domain/entities/admin_dashboard_stats_entity.dart';
import 'package:zapshift/features/admin/domain/repositories/admin_repository.dart';
import 'package:zapshift/features/admin/domain/usecases/add_staff_usecase.dart';
import 'package:zapshift/features/admin/domain/usecases/assign_issue_usecase.dart';
import 'package:zapshift/features/admin/domain/usecases/get_admin_dashboard_stats_usecase.dart';
import 'package:zapshift/features/admin/domain/usecases/get_all_admin_issues_usecase.dart';
import 'package:zapshift/features/admin/domain/usecases/get_all_users_usecase.dart';
import 'package:zapshift/features/admin/domain/usecases/get_staffs_usecase.dart';
import 'package:zapshift/features/admin/domain/usecases/toggle_block_user_usecase.dart';
import 'package:zapshift/features/auth/domain/entities/user_entity.dart';
import 'package:zapshift/features/issues/domain/entities/issue_entity.dart';

class FakeAdminRepository implements AdminRepository {
  @override
  Future<(Failure?, List<UserEntity>?)> getUsers({
    int? limit,
    String? sort,
  }) async => (
    null,
    [
      const UserEntity(
        id: 'u1',
        name: 'Citizen One',
        email: 'c1@piirs.org',
        role: 'citizen',
      ),
    ],
  );

  @override
  Future<(Failure?, bool)> toggleBlockUser({
    required String userId,
    required bool isBlocked,
  }) async => (null, true);

  @override
  Future<(Failure?, List<UserEntity>?)> getStaffs(String role) async => (
    null,
    [
      const UserEntity(
        id: 's1',
        name: 'Staff Officer',
        email: 's1@piirs.gov',
        role: 'staff',
      ),
    ],
  );

  @override
  Future<(Failure?, bool)> addStaff(AddStaffParams params) async =>
      (null, true);

  @override
  Future<(Failure?, List<IssueEntity>?)> getAllAdminIssues() async => (
    null,
    [
      IssueEntity(
        id: 'i1',
        title: 'Damaged Guardrail',
        description: 'Highway 4',
        category: 'Safety',
        status: 'pending',
        upvotes: 8,
        authorEmail: 'c1@piirs.org',
        createdAt: DateTime.now(),
      ),
    ],
  );

  @override
  Future<(Failure?, bool)> assignIssue({
    required String issueId,
    required String staffEmail,
  }) async => (null, true);

  @override
  Future<(Failure?, AdminDashboardStatsEntity?)>
  getAdminDashboardStats() async => (
    null,
    const AdminDashboardStatsEntity(
      totalIssues: 45,
      totalResolvedIssues: 30,
      totalPendingIssues: 10,
      totalRejectedIssues: 5,
      paymentsCount: 8,
      paymentsTotalAmount: 8000.0,
    ),
  );
}

void main() {
  late FakeAdminRepository repository;
  late GetAllUsersUseCase getAllUsersUseCase;
  late ToggleBlockUserUseCase toggleBlockUserUseCase;
  late GetStaffsUseCase getStaffsUseCase;
  late AddStaffUseCase addStaffUseCase;
  late GetAllAdminIssuesUseCase getAllAdminIssuesUseCase;
  late AssignIssueUseCase assignIssueUseCase;
  late GetAdminDashboardStatsUseCase getAdminDashboardStatsUseCase;

  setUp(() {
    repository = FakeAdminRepository();
    getAllUsersUseCase = GetAllUsersUseCase(repository);
    toggleBlockUserUseCase = ToggleBlockUserUseCase(repository);
    getStaffsUseCase = GetStaffsUseCase(repository);
    addStaffUseCase = AddStaffUseCase(repository);
    getAllAdminIssuesUseCase = GetAllAdminIssuesUseCase(repository);
    assignIssueUseCase = AssignIssueUseCase(repository);
    getAdminDashboardStatsUseCase = GetAdminDashboardStatsUseCase(repository);
  });

  group('Admin Domain UseCases Unit Tests', () {
    test('GetAllUsersUseCase returns list of users', () async {
      final (failure, users) = await getAllUsersUseCase();
      expect(failure, isNull);
      expect(users?.length, 1);
      expect(users?.first.email, 'c1@piirs.org');
    });

    test('ToggleBlockUserUseCase blocks user successfully', () async {
      final (failure, success) = await toggleBlockUserUseCase(
        userId: 'u1',
        isBlocked: true,
      );
      expect(failure, isNull);
      expect(success, isTrue);
    });

    test('GetStaffsUseCase retrieves staff list', () async {
      final (failure, staffs) = await getStaffsUseCase('staff');
      expect(failure, isNull);
      expect(staffs?.first.role, 'staff');
    });

    test('AddStaffUseCase provisions new staff member', () async {
      final (failure, success) = await addStaffUseCase(
        const AddStaffParams(
          name: 'Officer John',
          email: 'john@piirs.gov',
          password: 'securePassword123',
        ),
      );
      expect(failure, isNull);
      expect(success, isTrue);
    });

    test(
      'GetAllAdminIssuesUseCase retrieves all issues for moderation',
      () async {
        final (failure, issues) = await getAllAdminIssuesUseCase();
        expect(failure, isNull);
        expect(issues?.first.title, 'Damaged Guardrail');
      },
    );

    test('AssignIssueUseCase assigns issue to designated staff', () async {
      final (failure, success) = await assignIssueUseCase(
        issueId: 'i1',
        staffEmail: 's1@piirs.gov',
      );
      expect(failure, isNull);
      expect(success, isTrue);
    });

    test(
      'GetAdminDashboardStatsUseCase retrieves overview statistics',
      () async {
        final (failure, stats) = await getAdminDashboardStatsUseCase();
        expect(failure, isNull);
        expect(stats?.totalIssues, 45);
        expect(stats?.paymentsTotalAmount, 8000.0);
      },
    );
  });
}
