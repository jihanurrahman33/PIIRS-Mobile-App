import 'package:flutter_bloc/flutter_bloc.dart';

import 'report_issue_draft_event.dart';
import 'report_issue_draft_state.dart';

/// BLoC managing new issue report draft parameters.
class ReportIssueDraftBloc
    extends Bloc<ReportIssueDraftEvent, ReportIssueDraftState> {
  ReportIssueDraftBloc() : super(const ReportIssueDraftState()) {
    on<ChangePriorityEvent>((event, emit) {
      emit(state.copyWith(priority: event.priority));
    });
    on<ToggleAnonymousEvent>((event, emit) {
      emit(state.copyWith(isAnonymous: event.isAnonymous));
    });
  }
}
