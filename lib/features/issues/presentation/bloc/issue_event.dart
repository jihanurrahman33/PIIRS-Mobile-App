import 'package:equatable/equatable.dart';

import '../../domain/entities/issue_entity.dart';

/// Base event class for IssueBloc.
abstract class IssueEvent extends Equatable {
  const IssueEvent();

  @override
  List<Object?> get props => [];
}

/// Event triggered to load public issues list.
class FetchIssuesEvent extends IssueEvent {
  const FetchIssuesEvent();
}

/// Event triggered to load details of a specific issue.
class FetchIssueDetailsEvent extends IssueEvent {
  final String issueId;

  const FetchIssueDetailsEvent(this.issueId);

  @override
  List<Object?> get props => [issueId];
}

/// Event triggered to submit a new issue.
class CreateIssueRequestedEvent extends IssueEvent {
  final IssueEntity issue;

  const CreateIssueRequestedEvent(this.issue);

  @override
  List<Object?> get props => [issue];
}

/// Event triggered to upvote an issue.
class UpvoteIssueRequestedEvent extends IssueEvent {
  final String issueId;

  const UpvoteIssueRequestedEvent(this.issueId);

  @override
  List<Object?> get props => [issueId];
}

/// Event triggered to load current user's submitted issues.
class FetchMyIssuesEvent extends IssueEvent {
  final String email;

  const FetchMyIssuesEvent(this.email);

  @override
  List<Object?> get props => [email];
}
