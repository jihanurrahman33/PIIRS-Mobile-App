import 'package:flutter_test/flutter_test.dart';

import 'package:zapshift/core/errors/failures.dart';
import 'package:zapshift/features/dashboard/domain/entities/citizen_dashboard_stats_entity.dart';
import 'package:zapshift/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:zapshift/features/dashboard/domain/usecases/get_citizen_dashboard_stats_usecase.dart';
import 'package:zapshift/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:zapshift/features/dashboard/presentation/bloc/dashboard_event.dart';
import 'package:zapshift/features/dashboard/presentation/bloc/dashboard_state.dart';

class MockDashboardRepository implements DashboardRepository {
  @override
  Future<(Failure?, CitizenDashboardStatsEntity?)> getCitizenStats(
      String email) async {
    return (
      null,
      const CitizenDashboardStatsEntity(
        totalSubmitted: 5,
        totalResolved: 4,
        totalInProgress: 1,
        totalUpvotesGiven: 10,
        impactPoints: 150,
      )
    );
  }
}

void main() {
  late MockDashboardRepository mockRepository;
  late GetCitizenDashboardStatsUseCase getCitizenDashboardStatsUseCase;
  late DashboardBloc dashboardBloc;

  setUp(() {
    mockRepository = MockDashboardRepository();
    getCitizenDashboardStatsUseCase =
        GetCitizenDashboardStatsUseCase(mockRepository);
    dashboardBloc = DashboardBloc(
      getCitizenDashboardStatsUseCase: getCitizenDashboardStatsUseCase,
    );
  });

  tearDown(() {
    dashboardBloc.close();
  });

  group('DashboardBloc Unit Tests', () {
    test('initial state is DashboardInitialState', () {
      expect(dashboardBloc.state, isA<DashboardInitialState>());
    });

    test(
        'emits [DashboardLoadingState, CitizenDashboardStatsLoadedState] on FetchCitizenDashboardStatsEvent',
        () async {
      final expected = [
        isA<DashboardLoadingState>(),
        isA<CitizenDashboardStatsLoadedState>(),
      ];
      expectLater(dashboardBloc.stream, emitsInOrder(expected));
      dashboardBloc.add(const FetchCitizenDashboardStatsEvent('user@test.com'));
    });
  });
}
