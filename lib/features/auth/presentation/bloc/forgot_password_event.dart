import 'package:equatable/equatable.dart';

/// Base event for ForgotPasswordBloc.
abstract class ForgotPasswordEvent extends Equatable {
  const ForgotPasswordEvent();

  @override
  List<Object?> get props => [];
}

/// Event dispatched when password reset link request is submitted.
class SubmitResetRequestEvent extends ForgotPasswordEvent {
  final String email;

  const SubmitResetRequestEvent(this.email);

  @override
  List<Object?> get props => [email];
}
