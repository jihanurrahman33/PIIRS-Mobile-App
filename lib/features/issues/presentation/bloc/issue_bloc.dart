import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/create_issue_usecase.dart';
import '../../domain/usecases/get_issue_details_usecase.dart';
import '../../domain/usecases/get_issues_usecase.dart';
import '../../domain/usecases/upvote_issue_usecase.dart';
import 'issue_event.dart';
import 'issue_state.dart';

/// Business Logic Component managing issue states and UI event handlers.
class IssueBloc extends Bloc<IssueEvent, IssueState> {
  final GetIssuesUseCase getIssuesUseCase;
  final GetIssueDetailsUseCase getIssueDetailsUseCase;
  final CreateIssueUseCase createIssueUseCase;
  final UpvoteIssueUseCase upvoteIssueUseCase;

  IssueBloc({
    required this.getIssuesUseCase,
    required this.getIssueDetailsUseCase,
    required this.createIssueUseCase,
    required this.upvoteIssueUseCase,
  }) : super(const IssueInitialState()) {
    on<FetchIssuesEvent>(_onFetchIssues);
    on<FetchIssueDetailsEvent>(_onFetchIssueDetails);
    on<CreateIssueRequestedEvent>(_onCreateIssueRequested);
    on<UpvoteIssueRequestedEvent>(_onUpvoteIssueRequested);
  }

  Future<void> _onFetchIssues(
    FetchIssuesEvent event,
    Emitter<IssueState> emit,
  ) async {
    emit(const IssueLoadingState());
    final (failure, issues) = await getIssuesUseCase();
    if (failure != null) {
      emit(IssueFailureState(failure));
    } else {
      emit(IssuesLoadedState(issues ?? []));
    }
  }

  Future<void> _onFetchIssueDetails(
    FetchIssueDetailsEvent event,
    Emitter<IssueState> emit,
  ) async {
    emit(const IssueLoadingState());
    final (failure, issue) = await getIssueDetailsUseCase(event.issueId);
    if (failure != null) {
      emit(IssueFailureState(failure));
    } else if (issue != null) {
      emit(IssueDetailsLoadedState(issue));
    }
  }

  Future<void> _onCreateIssueRequested(
    CreateIssueRequestedEvent event,
    Emitter<IssueState> emit,
  ) async {
    emit(const IssueLoadingState());
    final (failure, createdIssue) = await createIssueUseCase(event.issue);
    if (failure != null) {
      emit(IssueFailureState(failure));
    } else if (createdIssue != null) {
      emit(IssueCreatedSuccessState(createdIssue));
    }
  }

  Future<void> _onUpvoteIssueRequested(
    UpvoteIssueRequestedEvent event,
    Emitter<IssueState> emit,
  ) async {
    final (failure, updatedIssue) = await upvoteIssueUseCase(event.issueId);
    if (failure != null) {
      emit(IssueFailureState(failure));
    } else if (updatedIssue != null) {
      emit(IssueDetailsLoadedState(updatedIssue));
    }
  }
}
