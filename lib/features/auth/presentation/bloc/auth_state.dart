import 'package:equatable/equatable.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/entities/user_entity.dart';

/// Sealed abstract base class for authentication BLoC states.
abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

/// Initial uninitialized state.
class AuthInitialState extends AuthState {
  const AuthInitialState();
}

/// Async operation loading state.
class AuthLoadingState extends AuthState {
  const AuthLoadingState();
}

/// Successfully authenticated state with active [UserEntity].
class AuthenticatedState extends AuthState {
  final UserEntity user;

  const AuthenticatedState(this.user);

  @override
  List<Object?> get props => [user];
}

/// Unauthenticated state (logged out or no active session).
class UnauthenticatedState extends AuthState {
  const UnauthenticatedState();
}

/// Authentication operation failure state.
class AuthFailureState extends AuthState {
  final Failure failure;

  const AuthFailureState(this.failure);

  @override
  List<Object?> get props => [failure];
}

/// State emitted when account is blocked or under administrative review.
class AccountBlockedState extends AuthState {
  final String reason;

  const AccountBlockedState(
      [this.reason = 'Account suspended by administrator.']);

  @override
  List<Object?> get props => [reason];
}
