import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_citizen_dashboard_stats_usecase.dart';
import 'dashboard_event.dart';
import 'dashboard_state.dart';

/// Business Logic Component managing citizen dashboard metrics & UI states.
class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final GetCitizenDashboardStatsUseCase getCitizenDashboardStatsUseCase;

  DashboardBloc({
    required this.getCitizenDashboardStatsUseCase,
  }) : super(const DashboardInitialState()) {
    on<FetchCitizenDashboardStatsEvent>(_onFetchCitizenDashboardStats);
  }

  Future<void> _onFetchCitizenDashboardStats(
    FetchCitizenDashboardStatsEvent event,
    Emitter<DashboardState> emit,
  ) async {
    emit(const DashboardLoadingState());
    final (failure, stats) = await getCitizenDashboardStatsUseCase(event.email);
    if (failure != null) {
      emit(DashboardFailureState(failure));
    } else if (stats != null) {
      emit(CitizenDashboardStatsLoadedState(stats));
    }
  }
}
