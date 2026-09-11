import 'package:flutter_bloc/flutter_bloc.dart';

import 'post_upvote_event.dart';
import 'post_upvote_state.dart';

/// BLoC managing upvote state for community issue posts.
class PostUpvoteBloc extends Bloc<PostUpvoteEvent, PostUpvoteState> {
  PostUpvoteBloc({required int initialUpvotes})
    : super(PostUpvoteState(upvotes: initialUpvotes, isUpvoted: false)) {
    on<TogglePostUpvoteEvent>(_onToggleUpvote);
  }

  void _onToggleUpvote(
    TogglePostUpvoteEvent event,
    Emitter<PostUpvoteState> emit,
  ) {
    final nextIsUpvoted = !state.isUpvoted;
    final nextUpvotes = state.upvotes + (nextIsUpvoted ? 1 : -1);
    emit(PostUpvoteState(upvotes: nextUpvotes, isUpvoted: nextIsUpvoted));
  }
}
