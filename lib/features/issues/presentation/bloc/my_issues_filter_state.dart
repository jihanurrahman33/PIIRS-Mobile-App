import 'package:equatable/equatable.dart';

/// State representing currently selected status tab in My Issues.
class MyIssuesFilterState extends Equatable {
  final String selectedTab;

  const MyIssuesFilterState({this.selectedTab = 'All'});

  @override
  List<Object?> get props => [selectedTab];
}
