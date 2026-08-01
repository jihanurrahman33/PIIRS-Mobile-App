import 'package:flutter_test/flutter_test.dart';
import 'package:zapshift/core/errors/failures.dart';
import 'package:zapshift/features/auth/domain/entities/user_entity.dart';
import 'package:zapshift/features/auth/domain/repositories/auth_repository.dart';
import 'package:zapshift/features/auth/domain/usecases/login_usecase.dart';
import 'package:zapshift/features/auth/domain/usecases/logout_usecase.dart';
import 'package:zapshift/features/auth/domain/usecases/register_usecase.dart';
import 'package:zapshift/features/auth/domain/usecases/send_password_reset_usecase.dart';

class FakeAuthRepository implements AuthRepository {
  @override
  Future<(Failure?, UserEntity?)> login({
    required String email,
    required String password,
  }) async {
    if (email == 'valid@user.com' && password == 'password123') {
      return (
        null,
        const UserEntity(
          id: 'user_123',
          name: 'Jane Citizen',
          email: 'valid@user.com',
          role: 'citizen',
        )
      );
    }
    return (const UnauthorizedFailure('Invalid email or password.'), null);
  }

  @override
  Future<(Failure?, UserEntity?)> register({
    required String name,
    required String email,
    required String password,
    String role = 'citizen',
  }) async {
    return (
      null,
      UserEntity(
        id: 'new_123',
        name: name,
        email: email,
        role: role,
      )
    );
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
  late FakeAuthRepository repository;
  late LoginUseCase loginUseCase;
  late RegisterUseCase registerUseCase;
  late LogoutUseCase logoutUseCase;
  late SendPasswordResetUseCase sendPasswordResetUseCase;

  setUp(() {
    repository = FakeAuthRepository();
    loginUseCase = LoginUseCase(repository);
    registerUseCase = RegisterUseCase(repository);
    logoutUseCase = LogoutUseCase(repository);
    sendPasswordResetUseCase = SendPasswordResetUseCase(repository);
  });

  group('Auth UseCases Unit Tests', () {
    test('LoginUseCase returns UserEntity on valid credentials', () async {
      final (failure, user) = await loginUseCase(
        email: 'valid@user.com',
        password: 'password123',
      );

      expect(failure, isNull);
      expect(user, isNotNull);
      expect(user?.email, equals('valid@user.com'));
      expect(user?.isCitizen, isTrue);
    });

    test('LoginUseCase returns UnauthorizedFailure on invalid credentials',
        () async {
      final (failure, user) = await loginUseCase(
        email: 'invalid@user.com',
        password: 'wrongpassword',
      );

      expect(user, isNull);
      expect(failure, isA<UnauthorizedFailure>());
    });

    test('RegisterUseCase creates new user entity successfully', () async {
      final (failure, user) = await registerUseCase(
        name: 'John Citizen',
        email: 'john@example.com',
        password: 'Password123!',
      );

      expect(failure, isNull);
      expect(user?.name, equals('John Citizen'));
      expect(user?.email, equals('john@example.com'));
    });

    test('LogoutUseCase completes without error', () async {
      final (failure, _) = await logoutUseCase();
      expect(failure, isNull);
    });

    test('SendPasswordResetUseCase completes successfully', () async {
      final (failure, _) = await sendPasswordResetUseCase('john@example.com');
      expect(failure, isNull);
    });
  });
}
