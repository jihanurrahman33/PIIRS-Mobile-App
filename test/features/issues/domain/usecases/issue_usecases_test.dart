import 'package:flutter_test/flutter_test.dart';

import 'package:zapshift/core/errors/failures.dart';
import 'package:zapshift/features/issues/domain/entities/issue_entity.dart';
import 'package:zapshift/features/issues/domain/repositories/issue_repository.dart';
import 'package:zapshift/features/issues/domain/usecases/create_issue_usecase.dart';
import 'package:zapshift/features/issues/domain/usecases/get_issue_details_usecase.dart';
import 'package:zapshift/features/issues/domain/usecases/get_issues_usecase.dart';
import 'package:zapshift/features/issues/domain/usecases/upvote_issue_usecase.dart';

class FakeIssueRepository implements IssueRepository {
  final List<IssueEntity> _issues = [];

  @override
  Future<(Failure?, List<IssueEntity>?)> getIssues() async {
    return (null, _issues);
  }

  @override
  Future<(Failure?, IssueEntity?)> getIssueDetails(String issueId) async {
    final found = _issues.where((i) => i.id == issueId);
    if (found.isNotEmpty) return (null, found.first);
    return (const ServerFailure('Issue not found'), null);
  }

  @override
  Future<(Failure?, IssueEntity?)> createIssue(IssueEntity issue) async {
    _issues.add(issue);
    return (null, issue);
  }

  @override
  Future<(Failure?, IssueEntity?)> upvoteIssue(String issueId) async {
    final foundIndex = _issues.indexWhere((i) => i.id == issueId);
    if (foundIndex != -1) {
      final old = _issues[foundIndex];
      final updated = IssueEntity(
        id: old.id,
        title: old.title,
        description: old.description,
        category: old.category,
        status: old.status,
        upvotes: old.upvotes + 1,
        authorEmail: old.authorEmail,
        createdAt: old.createdAt,
      );
      _issues[foundIndex] = updated;
      return (null, updated);
    }
    return (const ServerFailure('Issue not found'), null);
  }

  @override
  Future<(Failure?, List<IssueEntity>?)> getMyIssues(String email) async {
    final filtered = _issues.where((i) => i.authorEmail == email).toList();
    return (null, filtered);
  }
}

void main() {
  late FakeIssueRepository fakeRepository;
  late GetIssuesUseCase getIssuesUseCase;
  late GetIssueDetailsUseCase getIssueDetailsUseCase;
  late CreateIssueUseCase createIssueUseCase;
  late UpvoteIssueUseCase upvoteIssueUseCase;

  setUp(() {
    fakeRepository = FakeIssueRepository();
    getIssuesUseCase = GetIssuesUseCase(fakeRepository);
    getIssueDetailsUseCase = GetIssueDetailsUseCase(fakeRepository);
    createIssueUseCase = CreateIssueUseCase(fakeRepository);
    upvoteIssueUseCase = UpvoteIssueUseCase(fakeRepository);
  });

  group('Issue Domain UseCases Tests', () {
    final sampleIssue = IssueEntity(
      id: '101',
      title: 'Pothole on 5th Ave',
      description: 'Deep road damage',
      category: 'Roads & Potholes',
      status: 'Pending',
      upvotes: 5,
      authorEmail: 'test@user.com',
      createdAt: DateTime.now(),
    );

    test('CreateIssueUseCase adds issue to repository', () async {
      final (failure, created) = await createIssueUseCase(sampleIssue);
      expect(failure, isNull);
      expect(created?.id, equals('101'));
    });

    test('GetIssuesUseCase returns list of issues', () async {
      await createIssueUseCase(sampleIssue);
      final (failure, issues) = await getIssuesUseCase();
      expect(failure, isNull);
      expect(issues?.length, equals(1));
    });

    test('GetIssueDetailsUseCase fetches specific issue details', () async {
      await createIssueUseCase(sampleIssue);
      final (failure, details) = await getIssueDetailsUseCase('101');
      expect(failure, isNull);
      expect(details?.title, equals('Pothole on 5th Ave'));
    });

    test('UpvoteIssueUseCase increments issue upvotes count', () async {
      await createIssueUseCase(sampleIssue);
      final (failure, updated) = await upvoteIssueUseCase('101');
      expect(failure, isNull);
      expect(updated?.upvotes, equals(6));
    });
  });
}
