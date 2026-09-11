import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/search_filter_bloc.dart';
import '../widgets/search_filter_chips_row.dart';
import '../widgets/search_issues_app_bar.dart';
import '../widgets/search_issues_results_list.dart';

/// Search Screen displaying query input, filter chips, and search results.
class SearchIssuesPage extends StatefulWidget {
  const SearchIssuesPage({super.key});

  @override
  State<SearchIssuesPage> createState() => _SearchIssuesPageState();
}

class _SearchIssuesPageState extends State<SearchIssuesPage> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SearchFilterBloc(),
      child: Scaffold(
        appBar: SearchIssuesAppBar(controller: _searchController),
        body: const SafeArea(
          child: Column(
            children: [
              SearchFilterChipsRow(),
              Divider(height: 1),
              Expanded(child: SearchIssuesResultsList()),
            ],
          ),
        ),
      ),
    );
  }
}
