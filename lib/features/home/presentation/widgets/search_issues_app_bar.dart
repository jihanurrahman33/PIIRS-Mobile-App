import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/search_filter_bloc.dart';
import '../bloc/search_filter_event.dart';
import '../bloc/search_filter_state.dart';

/// App bar for search issues screen with query field and clear action.
class SearchIssuesAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final TextEditingController controller;

  const SearchIssuesAppBar({super.key, required this.controller});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_rounded),
        onPressed: () => context.pop(),
      ),
      title: TextField(
        controller: controller,
        autofocus: true,
        decoration: const InputDecoration(
          hintText: 'Search issues by title, tag or area...',
          border: InputBorder.none,
        ),
        onChanged: (q) =>
            context.read<SearchFilterBloc>().add(ChangeSearchQueryEvent(q)),
      ),
      actions: [
        BlocBuilder<SearchFilterBloc, SearchFilterState>(
          buildWhen: (prev, curr) => prev.query != curr.query,
          builder: (context, state) {
            if (state.query.isEmpty) return const SizedBox.shrink();
            return IconButton(
              icon: const Icon(Icons.clear_rounded),
              onPressed: () {
                controller.clear();
                context.read<SearchFilterBloc>().add(
                  const ClearSearchQueryEvent(),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
