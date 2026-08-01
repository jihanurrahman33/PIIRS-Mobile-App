import 'package:flutter_test/flutter_test.dart';

import 'package:zapshift/core/errors/failures.dart';
import 'package:zapshift/features/issues/domain/entities/issue_entity.dart';
import 'package:zapshift/features/issues/domain/repositories/issue_repository.dart';
import 'package:zapshift/features/issues/domain/usecases/create_issue_usecase.dart';
import 'package:zapshift/features/issues/domain/usecases/get_issue_details_usecase.dart';
import 'package:zapshift/features/issues/domain/usecases/get_issues_usecase.dart';
import 'package:zapshift/features/issues/domain/usecases/upvote_issue_usecase.dart';
import 'package:zapshift/features/issues/presentation/bloc/issue_bloc.dart';
import 'package:zapshift/features/issues/presentation/bloc/issue_event.dart';
import 'package:zapshift/features/issues/presentation/bloc/issue_state.dart';

class MockIssueRepository implements IssueRepository {
  @override
  Future<(Failure?, List<IssueEntity>?)> getIssues() async {
    return (null, <IssueEntity>[]);
  }

  @override
  Future<(Failure?, IssueEntity?)> getIssueDetails(String issueId) async {
    return (
      null,
      IssueEntity(
        id: issueId,
        title: 'Test Issue',
        description: 'Desc',
        category: 'Roads',
        status: 'Pending',
        upvotes: 0,
        authorEmail: 'test@user.com',
        createdAt: DateTime.now(),
      )
    );
  }

  @override
  Future<(Failure?, IssueEntity?)> createIssue(IssueEntity issue) async {
    return (null, issue);
  }

  @override
  Future<(Failure?, IssueEntity?)> upvoteIssue(String issueId) async {
    return (null, null);
  }

  @override
  Future<(Failure?, List<IssueEntity>?)> getMyIssues(String email) async {
    return (null, <IssueEntity>[]);
  }
}

void main() {
  late MockIssueRepository mockRepository;
  late GetIssuesUseCase getIssuesUseCase;
  late GetIssueDetailsUseCase getIssueDetailsUseCase;
  late CreateIssueUseCase createIssueUseCase;
  late UpvoteIssueUseCase upvoteIssueUseCase;
  late IssueBloc issueBloc;

  setUp(() {
    mockRepository = MockIssueRepository();
    getIssuesUseCase = GetIssuesUseCase(mockRepository);
    getIssueDetailsUseCase = GetIssueDetailsUseCase(mockRepository);
    createIssueUseCase = CreateIssueUseCase(mockRepository);
    upvoteIssueUseCase = UpvoteIssueUseCase(mockRepository);

    issueBloc = IssueBloc(
      getIssuesUseCase: getIssuesUseCase,
      getIssueDetailsUseCase: getIssueDetailsUseCase,
      createIssueUseCase: createIssueUseCase,
      upvoteIssueUseCase: upvoteIssueUseCase,
    );
  });

  tearDown(() {
    issueBloc.close();
  });

  group('IssueBloc Unit Tests', () {
    test('initial state is IssueInitialState', () {
      expect(issueBloc.state, isA<IssueInitialState>());
    });

    test('emits [IssueLoadingState, IssuesLoadedState] on FetchIssuesEvent',
        () async {
      final expected = [
        isA<IssueLoadingState>(),
        isA<IssuesLoadedState>(),
      ];
      expectLater(issueBloc.stream, emitsInOrder(expected));
      issueBloc.add(const FetchIssuesEvent());
    });

    test(
        'emits [IssueLoadingState, IssueDetailsLoadedState] on FetchIssueDetailsEvent',
        () async {
      final expected = [
        isA<IssueLoadingState>(),
        isA<IssueDetailsLoadedState>(),
      ];
      expectLater(issueBloc.stream, emitsInOrder(expected));
      issueBloc.add(const FetchIssueDetailsEvent('101'));
    });
  });
}
