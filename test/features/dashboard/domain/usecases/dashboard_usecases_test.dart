import 'package:flutter_test/flutter_test.dart';

import 'package:zapshift/core/errors/failures.dart';
import 'package:zapshift/features/dashboard/domain/entities/citizen_dashboard_stats_entity.dart';
import 'package:zapshift/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:zapshift/features/dashboard/domain/usecases/get_citizen_dashboard_stats_usecase.dart';

class FakeDashboardRepository implements DashboardRepository {
  @override
  Future<(Failure?, CitizenDashboardStatsEntity?)> getCitizenStats(
      String email) async {
    return (
      null,
      const CitizenDashboardStatsEntity(
        totalSubmitted: 10,
        totalResolved: 8,
        totalInProgress: 2,
        totalUpvotesGiven: 15,
        impactPoints: 300,
      )
    );
  }
}

void main() {
  late FakeDashboardRepository fakeRepository;
  late GetCitizenDashboardStatsUseCase useCase;

  setUp(() {
    fakeRepository = FakeDashboardRepository();
    useCase = GetCitizenDashboardStatsUseCase(fakeRepository);
  });

  group('GetCitizenDashboardStatsUseCase Unit Tests', () {
    test('returns CitizenDashboardStatsEntity successfully', () async {
      final (failure, stats) = await useCase('citizen@zapshift.com');
      expect(failure, isNull);
      expect(stats?.totalSubmitted, equals(10));
      expect(stats?.impactPoints, equals(300));
    });
  });
}
