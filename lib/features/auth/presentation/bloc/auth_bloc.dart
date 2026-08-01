import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/logout_usecase.dart';
import '../../domain/usecases/register_usecase.dart';
import '../../domain/usecases/send_password_reset_usecase.dart';
import 'auth_event.dart';
import 'auth_state.dart';

/// Central BLoC managing authentication state transitions and user sessions.
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final LogoutUseCase logoutUseCase;
  final SendPasswordResetUseCase sendPasswordResetUseCase;
  final AuthRepository repository;

  AuthBloc({
    required this.loginUseCase,
    required this.registerUseCase,
    required this.logoutUseCase,
    required this.sendPasswordResetUseCase,
    required this.repository,
  }) : super(const AuthInitialState()) {
    on<CheckAuthStatusEvent>(_onCheckAuthStatus);
    on<LoginRequestedEvent>(_onLoginRequested);
    on<RegisterRequestedEvent>(_onRegisterRequested);
    on<LogoutRequestedEvent>(_onLogoutRequested);
    on<SendResetPasswordRequestedEvent>(_onSendResetPasswordRequested);
  }

  Future<void> _onCheckAuthStatus(
    CheckAuthStatusEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoadingState());
    final (failure, user) = await repository.getCurrentUser();
    if (user != null) {
      if (user.isBlocked) {
        emit(const AccountBlockedState());
      } else {
        emit(AuthenticatedState(user));
      }
    } else {
      emit(const UnauthenticatedState());
    }
  }

  Future<void> _onLoginRequested(
    LoginRequestedEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoadingState());
    final (failure, user) = await loginUseCase(
      email: event.email,
      password: event.password,
    );

    if (failure != null) {
      emit(AuthFailureState(failure));
    } else if (user != null) {
      if (user.isBlocked) {
        emit(const AccountBlockedState());
      } else {
        emit(AuthenticatedState(user));
      }
    } else {
      emit(const UnauthenticatedState());
    }
  }

  Future<void> _onRegisterRequested(
    RegisterRequestedEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoadingState());
    final (failure, user) = await registerUseCase(
      name: event.name,
      email: event.email,
      password: event.password,
      role: event.role,
    );

    if (failure != null) {
      emit(AuthFailureState(failure));
    } else if (user != null) {
      emit(AuthenticatedState(user));
    } else {
      emit(const UnauthenticatedState());
    }
  }

  Future<void> _onLogoutRequested(
    LogoutRequestedEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoadingState());
    await logoutUseCase();
    emit(const UnauthenticatedState());
  }

  Future<void> _onSendResetPasswordRequested(
    SendResetPasswordRequestedEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoadingState());
    final (failure, _) = await sendPasswordResetUseCase(event.email);
    if (failure != null) {
      emit(AuthFailureState(failure));
    } else {
      emit(const UnauthenticatedState());
    }
  }
}
