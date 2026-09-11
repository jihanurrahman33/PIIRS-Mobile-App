import 'package:equatable/equatable.dart';

/// State representing upvote status and count for a feed post.
class PostUpvoteState extends Equatable {
  final int upvotes;
  final bool isUpvoted;

  const PostUpvoteState({required this.upvotes, required this.isUpvoted});

  @override
  List<Object?> get props => [upvotes, isUpvoted];
}
