import 'package:equatable/equatable.dart';

/// Base event for post upvote BLoC.
abstract class PostUpvoteEvent extends Equatable {
  const PostUpvoteEvent();

  @override
  List<Object?> get props => [];
}

/// Event triggered when an upvote button is tapped.
class TogglePostUpvoteEvent extends PostUpvoteEvent {
  const TogglePostUpvoteEvent();
}
