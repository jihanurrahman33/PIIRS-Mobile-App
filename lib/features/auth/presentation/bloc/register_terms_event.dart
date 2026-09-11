import 'package:equatable/equatable.dart';

/// Base event for RegisterTermsBloc.
abstract class RegisterTermsEvent extends Equatable {
  const RegisterTermsEvent();

  @override
  List<Object?> get props => [];
}

/// Event triggered when Terms of Service checkbox is toggled.
class ToggleTermsEvent extends RegisterTermsEvent {
  final bool isAccepted;

  const ToggleTermsEvent(this.isAccepted);

  @override
  List<Object?> get props => [isAccepted];
}
