import 'package:equatable/equatable.dart';

/// Pure domain entity representing system overview metrics for admins.
class AdminDashboardStatsEntity extends Equatable {
  final int totalIssues;
  final int totalResolvedIssues;
  final int totalPendingIssues;
  final int totalRejectedIssues;
  final int paymentsCount;
  final double paymentsTotalAmount;
  final List<Map<String, dynamic>> last7Days;

  const AdminDashboardStatsEntity({
    required this.totalIssues,
    required this.totalResolvedIssues,
    required this.totalPendingIssues,
    required this.totalRejectedIssues,
    required this.paymentsCount,
    required this.paymentsTotalAmount,
    this.last7Days = const [],
  });

  @override
  List<Object?> get props => [
    totalIssues,
    totalResolvedIssues,
    totalPendingIssues,
    totalRejectedIssues,
    paymentsCount,
    paymentsTotalAmount,
    last7Days,
  ];
}
