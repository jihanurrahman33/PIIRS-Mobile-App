import 'package:equatable/equatable.dart';

/// Base event for MyIssuesFilterBloc.
abstract class MyIssuesFilterEvent extends Equatable {
  const MyIssuesFilterEvent();

  @override
  List<Object?> get props => [];
}

/// Event triggered when a status filter tab is selected.
class SelectMyIssuesTabEvent extends MyIssuesFilterEvent {
  final String tab;

  const SelectMyIssuesTabEvent(this.tab);

  @override
  List<Object?> get props => [tab];
}
