import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/explore_filter_bloc.dart';
import '../bloc/explore_filter_event.dart';
import '../bloc/explore_filter_state.dart';
import '../bloc/issue_bloc.dart';
import '../bloc/issue_event.dart';
import '../widgets/explore_filter_header.dart';
import '../widgets/explore_issues_list_section.dart';

/// Explore Issues Tab Page displaying Stitch-styled public issues feed.
class ExploreIssuesPage extends StatefulWidget {
  const ExploreIssuesPage({super.key});

  @override
  State<ExploreIssuesPage> createState() => _ExploreIssuesPageState();
}

class _ExploreIssuesPageState extends State<ExploreIssuesPage> {
  final ExploreFilterBloc _bloc = ExploreFilterBloc();

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  Future<void> _onRefresh() async {
    try {
      context.read<IssueBloc>().add(const FetchIssuesEvent());
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: Scaffold(
        appBar: AppBar(title: const Text('Explore Public Issues')),
        body: SafeArea(
          child: RefreshIndicator(
            onRefresh: _onRefresh,
            child: ListView(
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              padding: const EdgeInsets.all(16),
              children: [
                BlocBuilder<ExploreFilterBloc, ExploreFilterState>(
                  builder: (context, state) {
                    return ExploreFilterHeader(
                      selectedStatus: state.selectedStatus,
                      onStatusSelected: (s) =>
                          _bloc.add(SelectExploreStatusEvent(s)),
                      isMapView: state.isMapView,
                      onViewToggle: (v) => _bloc.add(ToggleExploreViewEvent(v)),
                    );
                  },
                ),
                const SizedBox(height: 16),
                const ExploreIssuesListSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
