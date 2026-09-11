import 'package:flutter_bloc/flutter_bloc.dart';

import 'my_issues_filter_event.dart';
import 'my_issues_filter_state.dart';

/// BLoC managing My Issues tab filter selection.
class MyIssuesFilterBloc
    extends Bloc<MyIssuesFilterEvent, MyIssuesFilterState> {
  MyIssuesFilterBloc() : super(const MyIssuesFilterState()) {
    on<SelectMyIssuesTabEvent>((event, emit) {
      emit(MyIssuesFilterState(selectedTab: event.tab));
    });
  }
}
