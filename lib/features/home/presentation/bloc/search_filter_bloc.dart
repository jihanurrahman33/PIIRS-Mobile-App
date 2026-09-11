import 'package:flutter_bloc/flutter_bloc.dart';

import 'search_filter_event.dart';
import 'search_filter_state.dart';

/// BLoC managing search query input and category filter chip state.
class SearchFilterBloc extends Bloc<SearchFilterEvent, SearchFilterState> {
  SearchFilterBloc() : super(const SearchFilterState()) {
    on<ChangeSearchFilterEvent>((event, emit) {
      emit(state.copyWith(selectedFilter: event.filter));
    });
    on<ChangeSearchQueryEvent>((event, emit) {
      emit(state.copyWith(query: event.query));
    });
    on<ClearSearchQueryEvent>((event, emit) {
      emit(state.copyWith(query: ''));
    });
  }
}
