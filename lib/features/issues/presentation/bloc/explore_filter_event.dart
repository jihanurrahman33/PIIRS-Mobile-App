import 'package:equatable/equatable.dart';

/// Base event for ExploreFilterBloc.
abstract class ExploreFilterEvent extends Equatable {
  const ExploreFilterEvent();

  @override
  List<Object?> get props => [];
}

/// Event triggered when issue status filter is selected.
class SelectExploreStatusEvent extends ExploreFilterEvent {
  final String status;

  const SelectExploreStatusEvent(this.status);

  @override
  List<Object?> get props => [status];
}

/// Event triggered when map/list view toggle changes.
class ToggleExploreViewEvent extends ExploreFilterEvent {
  final bool isMapView;

  const ToggleExploreViewEvent(this.isMapView);

  @override
  List<Object?> get props => [isMapView];
}
