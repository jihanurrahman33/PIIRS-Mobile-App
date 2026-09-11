import 'package:equatable/equatable.dart';

/// State representing draft issue priority and anonymous flag.
class ReportIssueDraftState extends Equatable {
  final String priority;
  final bool isAnonymous;

  const ReportIssueDraftState({
    this.priority = 'Urgent',
    this.isAnonymous = false,
  });

  ReportIssueDraftState copyWith({String? priority, bool? isAnonymous}) {
    return ReportIssueDraftState(
      priority: priority ?? this.priority,
      isAnonymous: isAnonymous ?? this.isAnonymous,
    );
  }

  @override
  List<Object?> get props => [priority, isAnonymous];
}
