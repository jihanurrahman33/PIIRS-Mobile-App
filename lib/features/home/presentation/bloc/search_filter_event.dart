import 'package:equatable/equatable.dart';

/// Base event for search filter BLoC.
abstract class SearchFilterEvent extends Equatable {
  const SearchFilterEvent();

  @override
  List<Object?> get props => [];
}

/// Event triggered when filter category chip changes.
class ChangeSearchFilterEvent extends SearchFilterEvent {
  final String filter;

  const ChangeSearchFilterEvent(this.filter);

  @override
  List<Object?> get props => [filter];
}

/// Event triggered when query text changes.
class ChangeSearchQueryEvent extends SearchFilterEvent {
  final String query;

  const ChangeSearchQueryEvent(this.query);

  @override
  List<Object?> get props => [query];
}

/// Event triggered when search query is cleared.
class ClearSearchQueryEvent extends SearchFilterEvent {
  const ClearSearchQueryEvent();
}
