import 'package:flutter_test/flutter_test.dart';
import 'package:zapshift/core/errors/failures.dart';
import 'package:zapshift/features/auth/domain/entities/user_entity.dart';
import 'package:zapshift/features/auth/domain/repositories/auth_repository.dart';
import 'package:zapshift/features/auth/domain/usecases/login_usecase.dart';
import 'package:zapshift/features/auth/domain/usecases/logout_usecase.dart';
import 'package:zapshift/features/auth/domain/usecases/register_usecase.dart';
import 'package:zapshift/features/auth/domain/usecases/send_password_reset_usecase.dart';
import 'package:zapshift/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:zapshift/features/auth/presentation/bloc/auth_event.dart';
import 'package:zapshift/features/auth/presentation/bloc/auth_state.dart';

class MockAuthRepository implements AuthRepository {
  @override
  Future<(Failure?, UserEntity?)> login({
    required String email,
    required String password,
  }) async {
    if (email == 'user@zapshift.com') {
      return (
        null,
        const UserEntity(
          id: '1',
          name: 'Zap User',
          email: 'user@zapshift.com',
          role: 'citizen',
        )
      );
    }
    return (const UnauthorizedFailure('Invalid credentials'), null);
  }

  @override
  Future<(Failure?, UserEntity?)> register({
    required String name,
    required String email,
    required String password,
    String role = 'citizen',
  }) async {
    return (null, UserEntity(id: '2', name: name, email: email, role: role));
  }

  @override
  Future<(Failure?, String?)> getUserRole(String email) async {
    return (null, 'citizen');
  }

  @override
  Future<(Failure?, void)> logout() async {
    return (null, null);
  }

  @override
  Future<(Failure?, void)> sendPasswordReset(String email) async {
    return (null, null);
  }

  @override
  Future<(Failure?, UserEntity?)> getCurrentUser() async {
    return (null, null);
  }
}

void main() {
  late MockAuthRepository repository;
  late LoginUseCase loginUseCase;
  late RegisterUseCase registerUseCase;
  late LogoutUseCase logoutUseCase;
  late SendPasswordResetUseCase sendPasswordResetUseCase;
  late AuthBloc authBloc;

  setUp(() {
    repository = MockAuthRepository();
    loginUseCase = LoginUseCase(repository);
    registerUseCase = RegisterUseCase(repository);
    logoutUseCase = LogoutUseCase(repository);
    sendPasswordResetUseCase = SendPasswordResetUseCase(repository);

    authBloc = AuthBloc(
      loginUseCase: loginUseCase,
      registerUseCase: registerUseCase,
      logoutUseCase: logoutUseCase,
      sendPasswordResetUseCase: sendPasswordResetUseCase,
      repository: repository,
    );
  });

  tearDown(() {
    authBloc.close();
  });

  group('AuthBloc Tests', () {
    test('initial state is AuthInitialState', () {
      expect(authBloc.state, equals(const AuthInitialState()));
    });

    test(
        'emits [AuthLoadingState, UnauthenticatedState] on CheckAuthStatusEvent when no cached user',
        () async {
      final expectedStates = [
        const AuthLoadingState(),
        const UnauthenticatedState(),
      ];

      expectLater(authBloc.stream, emitsInOrder(expectedStates));

      authBloc.add(const CheckAuthStatusEvent());
    });

    test(
        'emits [AuthLoadingState, AuthenticatedState] on LoginRequestedEvent with valid credentials',
        () async {
      final expectedStates = [
        const AuthLoadingState(),
        isA<AuthenticatedState>(),
      ];

      expectLater(authBloc.stream, emitsInOrder(expectedStates));

      authBloc.add(const LoginRequestedEvent(
        email: 'user@zapshift.com',
        password: 'password123',
      ));
    });

    test(
        'emits [AuthLoadingState, AuthFailureState] on LoginRequestedEvent with invalid credentials',
        () async {
      final expectedStates = [
        const AuthLoadingState(),
        isA<AuthFailureState>(),
      ];

      expectLater(authBloc.stream, emitsInOrder(expectedStates));

      authBloc.add(const LoginRequestedEvent(
        email: 'wrong@zapshift.com',
        password: 'wrongpassword',
      ));
    });
  });
}
