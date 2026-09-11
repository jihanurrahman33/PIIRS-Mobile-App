import 'package:equatable/equatable.dart';

/// State representing notification feed read status.
class NotificationState extends Equatable {
  final bool allMarkedRead;

  const NotificationState({this.allMarkedRead = false});

  @override
  List<Object?> get props => [allMarkedRead];
}
