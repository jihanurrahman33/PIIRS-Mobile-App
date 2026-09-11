import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/my_issues_filter_bloc.dart';
import '../bloc/my_issues_filter_event.dart';
import '../bloc/my_issues_filter_state.dart';
import '../widgets/my_issues_filter_tabs.dart';
import '../widgets/my_issues_header_widget.dart';
import '../widgets/my_issues_list_section.dart';

/// My Issues Tab Page reflecting Stitch status hub design.
class MyIssuesPage extends StatefulWidget {
  const MyIssuesPage({super.key});

  @override
  State<MyIssuesPage> createState() => _MyIssuesPageState();
}

class _MyIssuesPageState extends State<MyIssuesPage> {
  final MyIssuesFilterBloc _bloc = MyIssuesFilterBloc();

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: Scaffold(
        appBar: AppBar(title: const Text('My Reported Issues')),
        body: SafeArea(
          child: ListView(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            padding: const EdgeInsets.all(16),
            children: [
              const MyIssuesHeaderWidget(),
              const SizedBox(height: 14),
              BlocBuilder<MyIssuesFilterBloc, MyIssuesFilterState>(
                builder: (context, state) {
                  return MyIssuesFilterTabs(
                    selectedTab: state.selectedTab,
                    onTabSelected: (tab) =>
                        _bloc.add(SelectMyIssuesTabEvent(tab)),
                  );
                },
              ),
              const SizedBox(height: 14),
              const MyIssuesListSection(),
            ],
          ),
        ),
      ),
    );
  }
}
