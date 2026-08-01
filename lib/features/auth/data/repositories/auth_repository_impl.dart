import '../../../../core/errors/failures.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_local_datasource.dart';
import '../datasources/auth_remote_datasource.dart';

/// Concrete implementation of [AuthRepository] bridging data sources to domain.
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<(Failure?, UserEntity?)> login({
    required String email,
    required String password,
  }) async {
    if (!await networkInfo.isConnected) {
      return (const NetworkFailure(), null);
    }
    try {
      final userModel = await remoteDataSource.login(
        email: email,
        password: password,
      );
      await localDataSource.cacheUserProfile(userModel);
      return (null, userModel.toEntity());
    } on UnauthorizedException catch (e) {
      return (UnauthorizedFailure(e.message), null);
    } on BadRequestException catch (e) {
      return (BadRequestFailure(e.message), null);
    } on ServerException catch (e) {
      return (ServerFailure(e.message), null);
    } catch (e) {
      return (UnknownFailure(e.toString()), null);
    }
  }

  @override
  Future<(Failure?, UserEntity?)> register({
    required String name,
    required String email,
    required String password,
    String role = 'citizen',
  }) async {
    if (!await networkInfo.isConnected) {
      return (const NetworkFailure(), null);
    }
    try {
      final userModel = await remoteDataSource.register(
        name: name,
        email: email,
        password: password,
        role: role,
      );
      await localDataSource.cacheUserProfile(userModel);
      return (null, userModel.toEntity());
    } on BadRequestException catch (e) {
      return (BadRequestFailure(e.message), null);
    } on ServerException catch (e) {
      return (ServerFailure(e.message), null);
    } catch (e) {
      return (UnknownFailure(e.toString()), null);
    }
  }

  @override
  Future<(Failure?, String?)> getUserRole(String email) async {
    if (!await networkInfo.isConnected) {
      return (const NetworkFailure(), null);
    }
    try {
      final role = await remoteDataSource.getUserRole(email);
      return (null, role);
    } catch (e) {
      return (const ServerFailure('Failed to fetch user role.'), null);
    }
  }

  @override
  Future<(Failure?, void)> logout() async {
    try {
      await localDataSource.clearAuthToken();
      return (null, null);
    } catch (e) {
      return (UnknownFailure(e.toString()), null);
    }
  }

  @override
  Future<(Failure?, void)> sendPasswordReset(String email) async {
    if (!await networkInfo.isConnected) {
      return (const NetworkFailure(), null);
    }
    try {
      await remoteDataSource.sendPasswordReset(email);
      return (null, null);
    } catch (e) {
      return (ServerFailure(e.toString()), null);
    }
  }

  @override
  Future<(Failure?, UserEntity?)> getCurrentUser() async {
    try {
      final cachedUser = await localDataSource.getCachedUserProfile();
      if (cachedUser != null) {
        return (null, cachedUser.toEntity());
      }
      return (null, null);
    } catch (e) {
      return (UnknownFailure(e.toString()), null);
    }
  }
}
