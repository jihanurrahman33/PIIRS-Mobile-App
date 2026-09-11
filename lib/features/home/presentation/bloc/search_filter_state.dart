import 'package:equatable/equatable.dart';

/// State representing search query text and active filter category.
class SearchFilterState extends Equatable {
  final String selectedFilter;
  final String query;

  const SearchFilterState({this.selectedFilter = 'All', this.query = ''});

  SearchFilterState copyWith({String? selectedFilter, String? query}) {
    return SearchFilterState(
      selectedFilter: selectedFilter ?? this.selectedFilter,
      query: query ?? this.query,
    );
  }

  @override
  List<Object?> get props => [selectedFilter, query];
}
