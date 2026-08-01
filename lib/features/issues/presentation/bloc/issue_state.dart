import 'package:equatable/equatable.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/entities/issue_entity.dart';

/// Base state class for IssueBloc.
abstract class IssueState extends Equatable {
  const IssueState();

  @override
  List<Object?> get props => [];
}

/// Initial state of IssueBloc.
class IssueInitialState extends IssueState {
  const IssueInitialState();
}

/// Loading state during async issue operations.
class IssueLoadingState extends IssueState {
  const IssueLoadingState();
}

/// State emitted when public issues list is loaded.
class IssuesLoadedState extends IssueState {
  final List<IssueEntity> issues;

  const IssuesLoadedState(this.issues);

  @override
  List<Object?> get props => [issues];
}

/// State emitted when single issue details are loaded.
class IssueDetailsLoadedState extends IssueState {
  final IssueEntity issue;

  const IssueDetailsLoadedState(this.issue);

  @override
  List<Object?> get props => [issue];
}

/// State emitted when a new issue is successfully created.
class IssueCreatedSuccessState extends IssueState {
  final IssueEntity issue;

  const IssueCreatedSuccessState(this.issue);

  @override
  List<Object?> get props => [issue];
}

/// State emitted when an issue operation fails.
class IssueFailureState extends IssueState {
  final Failure failure;

  const IssueFailureState(this.failure);

  @override
  List<Object?> get props => [failure];
}
