import '../../domain/entities/admin_dashboard_stats_entity.dart';

/// Data model representing Admin dashboard statistics API response.
class AdminDashboardStatsModel extends AdminDashboardStatsEntity {
  const AdminDashboardStatsModel({
    required super.totalIssues,
    required super.totalResolvedIssues,
    required super.totalPendingIssues,
    required super.totalRejectedIssues,
    required super.paymentsCount,
    required super.paymentsTotalAmount,
    super.last7Days,
  });

  factory AdminDashboardStatsModel.fromJson(
    Map<String, dynamic> json,
  ) => AdminDashboardStatsModel(
    totalIssues: (json['totalIssues'] as num?)?.toInt() ?? 0,
    totalResolvedIssues: (json['totalResolvedIssues'] as num?)?.toInt() ?? 0,
    totalPendingIssues: (json['totalPendingIssues'] as num?)?.toInt() ?? 0,
    totalRejectedIssues: (json['totalRejectedIssues'] as num?)?.toInt() ?? 0,
    paymentsCount: (json['paymentsCount'] as num?)?.toInt() ?? 0,
    paymentsTotalAmount:
        (json['paymentsTotalAmount'] as num?)?.toDouble() ?? 0.0,
    last7Days:
        (json['last7Days'] as List?)
            ?.map((e) => Map<String, dynamic>.from(e as Map))
            .toList() ??
        const [],
  );
}
