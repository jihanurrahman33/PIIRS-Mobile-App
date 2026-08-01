import 'package:equatable/equatable.dart';

/// Pure domain entity representing a user/staff comment on an issue.
class IssueCommentEntity extends Equatable {
  final String id;
  final String issueId;
  final String authorEmail;
  final String authorName;
  final String commentText;
  final DateTime createdAt;

  const IssueCommentEntity({
    required this.id,
    required this.issueId,
    required this.authorEmail,
    required this.authorName,
    required this.commentText,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
        issueId,
        authorEmail,
        authorName,
        commentText,
        createdAt,
      ];
}
