import 'package:flutter_bloc/flutter_bloc.dart';

import 'explore_filter_event.dart';
import 'explore_filter_state.dart';

/// BLoC managing explore screen filters and view mode.
class ExploreFilterBloc extends Bloc<ExploreFilterEvent, ExploreFilterState> {
  ExploreFilterBloc() : super(const ExploreFilterState()) {
    on<SelectExploreStatusEvent>((event, emit) {
      emit(state.copyWith(selectedStatus: event.status));
    });
    on<ToggleExploreViewEvent>((event, emit) {
      emit(state.copyWith(isMapView: event.isMapView));
    });
  }
}
