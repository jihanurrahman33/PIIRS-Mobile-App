import 'package:equatable/equatable.dart';

/// Sealed abstract base class for authentication BLoC events.
abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

/// Event dispatched to check cached session status on app launch.
class CheckAuthStatusEvent extends AuthEvent {
  const CheckAuthStatusEvent();
}

/// Event dispatched when user submits credentials on login screen.
class LoginRequestedEvent extends AuthEvent {
  final String email;
  final String password;

  const LoginRequestedEvent({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}

/// Event dispatched when citizen submits registration form.
class RegisterRequestedEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;
  final String role;

  const RegisterRequestedEvent({
    required this.name,
    required this.email,
    required this.password,
    this.role = 'citizen',
  });

  @override
  List<Object?> get props => [name, email, password, role];
}

/// Event dispatched when user logs out.
class LogoutRequestedEvent extends AuthEvent {
  const LogoutRequestedEvent();
}

/// Event dispatched when requesting password reset link.
class SendResetPasswordRequestedEvent extends AuthEvent {
  final String email;

  const SendResetPasswordRequestedEvent(this.email);

  @override
  List<Object?> get props => [email];
}
