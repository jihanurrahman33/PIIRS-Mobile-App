import 'package:get_it/get_it.dart';

import '../../features/auth/data/datasources/auth_local_datasource.dart';
import '../../features/auth/data/datasources/auth_remote_datasource.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/domain/usecases/get_user_role_usecase.dart';
import '../../features/auth/domain/usecases/login_usecase.dart';
import '../../features/auth/domain/usecases/logout_usecase.dart';
import '../../features/auth/domain/usecases/register_usecase.dart';
import '../../features/auth/domain/usecases/send_password_reset_usecase.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';
import '../../features/issues/data/datasources/issue_remote_datasource.dart';
import '../../features/issues/data/datasources/issue_remote_datasource_impl.dart';
import '../../features/issues/data/repositories/issue_repository_impl.dart';
import '../../features/issues/domain/repositories/issue_repository.dart';
import '../../features/issues/domain/usecases/create_issue_usecase.dart';
import '../../features/issues/domain/usecases/get_issue_details_usecase.dart';
import '../../features/issues/domain/usecases/get_issues_usecase.dart';
import '../../features/issues/domain/usecases/upvote_issue_usecase.dart';
import '../../features/issues/presentation/bloc/issue_bloc.dart';
import '../network/api_client.dart';
import '../network/auth_token_provider.dart';
import '../network/http_api_client.dart';
import '../network/network_info.dart';
import '../network/secure_storage_auth_token_provider.dart';
import '../services/onboarding_storage.dart';
import '../services/secure_storage_service.dart';

/// Global dependency injection container instance.
final sl = GetIt.instance;

/// Sets up global singletons and factories.
Future<void> setupServiceLocator() async {
  // ---------------------------------------------------------------------------
  // Core Storage & Security Services
  // ---------------------------------------------------------------------------
  sl.registerLazySingleton<SecureStorageService>(
    () => FlutterSecureStorageService(),
  );

  sl.registerLazySingleton<OnboardingStorage>(
    () => SharedPreferencesOnboardingStorage(),
  );

  sl.registerLazySingleton<AuthTokenProvider>(
    () => SecureStorageAuthTokenProvider(
      storageService: sl<SecureStorageService>(),
    ),
  );

  // ---------------------------------------------------------------------------
  // Core Network & Infrastructure
  // ---------------------------------------------------------------------------
  sl.registerLazySingleton<NetworkInfo>(
    () => SimpleNetworkInfo(),
  );

  sl.registerLazySingleton<ApiClient>(
    () => HttpApiClient(
      tokenProvider: sl<AuthTokenProvider>(),
    ),
  );

  // ---------------------------------------------------------------------------
  // Auth Feature Data & Domain Layers
  // ---------------------------------------------------------------------------
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(apiClient: sl<ApiClient>()),
  );

  sl.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(storageService: sl<SecureStorageService>()),
  );

  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: sl<AuthRemoteDataSource>(),
      localDataSource: sl<AuthLocalDataSource>(),
      networkInfo: sl<NetworkInfo>(),
    ),
  );

  // Auth UseCases
  sl.registerLazySingleton(() => LoginUseCase(sl<AuthRepository>()));
  sl.registerLazySingleton(() => RegisterUseCase(sl<AuthRepository>()));
  sl.registerLazySingleton(() => GetUserRoleUseCase(sl<AuthRepository>()));
  sl.registerLazySingleton(() => LogoutUseCase(sl<AuthRepository>()));
  sl.registerLazySingleton(
      () => SendPasswordResetUseCase(sl<AuthRepository>()));

  // Auth BLoC
  sl.registerFactory(
    () => AuthBloc(
      loginUseCase: sl<LoginUseCase>(),
      registerUseCase: sl<RegisterUseCase>(),
      logoutUseCase: sl<LogoutUseCase>(),
      sendPasswordResetUseCase: sl<SendPasswordResetUseCase>(),
      repository: sl<AuthRepository>(),
    ),
  );

  // ---------------------------------------------------------------------------
  // Issue Feature Data & Domain Layers
  // ---------------------------------------------------------------------------
  sl.registerLazySingleton<IssueRemoteDataSource>(
    () => IssueRemoteDataSourceImpl(apiClient: sl<ApiClient>()),
  );

  sl.registerLazySingleton<IssueRepository>(
    () => IssueRepositoryImpl(
      remoteDataSource: sl<IssueRemoteDataSource>(),
      networkInfo: sl<NetworkInfo>(),
    ),
  );

  // Issue UseCases
  sl.registerLazySingleton(() => GetIssuesUseCase(sl<IssueRepository>()));
  sl.registerLazySingleton(() => GetIssueDetailsUseCase(sl<IssueRepository>()));
  sl.registerLazySingleton(() => CreateIssueUseCase(sl<IssueRepository>()));
  sl.registerLazySingleton(() => UpvoteIssueUseCase(sl<IssueRepository>()));

  // Issue BLoC
  sl.registerFactory(
    () => IssueBloc(
      getIssuesUseCase: sl<GetIssuesUseCase>(),
      getIssueDetailsUseCase: sl<GetIssueDetailsUseCase>(),
      createIssueUseCase: sl<CreateIssueUseCase>(),
      upvoteIssueUseCase: sl<UpvoteIssueUseCase>(),
    ),
  );
}
