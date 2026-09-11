import 'package:equatable/equatable.dart';

/// State representing active status filter and view mode.
class ExploreFilterState extends Equatable {
  final String selectedStatus;
  final bool isMapView;

  const ExploreFilterState({
    this.selectedStatus = 'All Status',
    this.isMapView = false,
  });

  ExploreFilterState copyWith({String? selectedStatus, bool? isMapView}) {
    return ExploreFilterState(
      selectedStatus: selectedStatus ?? this.selectedStatus,
      isMapView: isMapView ?? this.isMapView,
    );
  }

  @override
  List<Object?> get props => [selectedStatus, isMapView];
}
