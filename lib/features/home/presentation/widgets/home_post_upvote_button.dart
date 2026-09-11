import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/post_upvote_bloc.dart';
import '../bloc/post_upvote_event.dart';
import '../bloc/post_upvote_state.dart';
import 'home_post_upvote_pill.dart';

/// Interactive upvote pill button powered by PostUpvoteBloc.
class HomePostUpvoteButton extends StatefulWidget {
  final int initialUpvotes;
  final PostUpvoteBloc? bloc;

  const HomePostUpvoteButton({
    super.key,
    required this.initialUpvotes,
    this.bloc,
  });

  @override
  State<HomePostUpvoteButton> createState() => _HomePostUpvoteButtonState();
}

class _HomePostUpvoteButtonState extends State<HomePostUpvoteButton> {
  late final PostUpvoteBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc =
        widget.bloc ?? PostUpvoteBloc(initialUpvotes: widget.initialUpvotes);
  }

  @override
  void dispose() {
    if (widget.bloc == null) _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: BlocBuilder<PostUpvoteBloc, PostUpvoteState>(
        builder: (context, state) {
          return HomePostUpvotePill(
            isUpvoted: state.isUpvoted,
            upvotes: state.upvotes,
            onTap: () => _bloc.add(const TogglePostUpvoteEvent()),
          );
        },
      ),
    );
  }
}
