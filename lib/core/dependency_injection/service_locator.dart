import 'package:get_it/get_it.dart';

import '../../features/admin/data/datasources/admin_remote_datasource.dart';
import '../../features/admin/data/datasources/admin_remote_datasource_impl.dart';
import '../../features/admin/data/repositories/admin_repository_impl.dart';
import '../../features/admin/domain/repositories/admin_repository.dart';
import '../../features/admin/domain/usecases/add_staff_usecase.dart';
import '../../features/admin/domain/usecases/assign_issue_usecase.dart';
import '../../features/admin/domain/usecases/get_admin_dashboard_stats_usecase.dart';
import '../../features/admin/domain/usecases/get_all_admin_issues_usecase.dart';
import '../../features/admin/domain/usecases/get_all_users_usecase.dart';
import '../../features/admin/domain/usecases/get_staffs_usecase.dart';
import '../../features/admin/domain/usecases/toggle_block_user_usecase.dart';
import '../../features/auth/data/datasources/auth_local_datasource.dart';
import '../../features/auth/data/datasources/auth_remote_datasource.dart';
import '../../features/auth/data/datasources/auth_remote_datasource_impl.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/domain/usecases/get_user_profile_usecase.dart';
import '../../features/auth/domain/usecases/get_user_role_usecase.dart';
import '../../features/auth/domain/usecases/login_usecase.dart';
import '../../features/auth/domain/usecases/logout_usecase.dart';
import '../../features/auth/domain/usecases/register_usecase.dart';
import '../../features/auth/domain/usecases/send_password_reset_usecase.dart';
import '../../features/auth/domain/usecases/sync_user_profile_usecase.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';
import '../../features/dashboard/data/datasources/dashboard_remote_datasource.dart';
import '../../features/dashboard/data/datasources/dashboard_remote_datasource_impl.dart';
import '../../features/dashboard/data/repositories/dashboard_repository_impl.dart';
import '../../features/dashboard/domain/repositories/dashboard_repository.dart';
import '../../features/dashboard/domain/usecases/get_citizen_dashboard_stats_usecase.dart';
import '../../features/dashboard/presentation/bloc/dashboard_bloc.dart';
import '../../features/issues/data/datasources/issue_remote_datasource.dart';
import '../../features/issues/data/datasources/issue_remote_datasource_impl.dart';
import '../../features/issues/data/repositories/issue_repository_impl.dart';
import '../../features/issues/domain/repositories/issue_repository.dart';
import '../../features/issues/domain/usecases/create_issue_usecase.dart';
import '../../features/issues/domain/usecases/get_all_issues_usecase.dart';
import '../../features/issues/domain/usecases/get_issue_details_usecase.dart';
import '../../features/issues/domain/usecases/get_issues_usecase.dart';
import '../../features/issues/domain/usecases/get_my_issues_usecase.dart';
import '../../features/issues/domain/usecases/get_user_issues_usecase.dart';
import '../../features/issues/domain/usecases/upvote_issue_usecase.dart';
import '../../features/issues/presentation/bloc/issue_bloc.dart';
import '../../features/premium/data/datasources/payment_remote_datasource.dart';
import '../../features/premium/data/datasources/payment_remote_datasource_impl.dart';
import '../../features/premium/data/repositories/payment_repository_impl.dart';
import '../../features/premium/domain/repositories/payment_repository.dart';
import '../../features/premium/domain/usecases/create_checkout_session_usecase.dart';
import '../../features/premium/domain/usecases/verify_payment_success_usecase.dart';
import '../../features/staff/data/datasources/staff_remote_datasource.dart';
import '../../features/staff/data/datasources/staff_remote_datasource_impl.dart';
import '../../features/staff/data/repositories/staff_repository_impl.dart';
import '../../features/staff/domain/repositories/staff_repository.dart';
import '../../features/staff/domain/usecases/get_staff_assigned_tasks_usecase.dart';
import '../../features/staff/domain/usecases/get_staff_dashboard_stats_usecase.dart';
import '../../features/staff/domain/usecases/update_issue_status_usecase.dart';
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
  sl.registerLazySingleton<NetworkInfo>(() => SimpleNetworkInfo());

  sl.registerLazySingleton<ApiClient>(
    () => HttpApiClient(tokenProvider: sl<AuthTokenProvider>()),
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
  sl.registerLazySingleton(() => GetUserProfileUseCase(sl<AuthRepository>()));
  sl.registerLazySingleton(() => SyncUserProfileUseCase(sl<AuthRepository>()));
  sl.registerLazySingleton(() => LogoutUseCase(sl<AuthRepository>()));
  sl.registerLazySingleton(
    () => SendPasswordResetUseCase(sl<AuthRepository>()),
  );

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
  sl.registerLazySingleton(() => GetAllIssuesUseCase(sl<IssueRepository>()));
  sl.registerLazySingleton(() => GetIssueDetailsUseCase(sl<IssueRepository>()));
  sl.registerLazySingleton(() => CreateIssueUseCase(sl<IssueRepository>()));
  sl.registerLazySingleton(() => UpvoteIssueUseCase(sl<IssueRepository>()));
  sl.registerLazySingleton(() => GetMyIssuesUseCase(sl<IssueRepository>()));
  sl.registerLazySingleton(() => GetUserIssuesUseCase(sl<IssueRepository>()));

  // Issue BLoC
  sl.registerFactory(
    () => IssueBloc(
      getIssuesUseCase: sl<GetIssuesUseCase>(),
      getIssueDetailsUseCase: sl<GetIssueDetailsUseCase>(),
      createIssueUseCase: sl<CreateIssueUseCase>(),
      upvoteIssueUseCase: sl<UpvoteIssueUseCase>(),
    ),
  );

  // ---------------------------------------------------------------------------
  // Dashboard Feature Data & Domain Layers
  // ---------------------------------------------------------------------------
  sl.registerLazySingleton<DashboardRemoteDataSource>(
    () => DashboardRemoteDataSourceImpl(apiClient: sl<ApiClient>()),
  );

  sl.registerLazySingleton<DashboardRepository>(
    () => DashboardRepositoryImpl(
      remoteDataSource: sl<DashboardRemoteDataSource>(),
      networkInfo: sl<NetworkInfo>(),
    ),
  );

  // Dashboard UseCases
  sl.registerLazySingleton(
    () => GetCitizenDashboardStatsUseCase(sl<DashboardRepository>()),
  );

  // Dashboard BLoC
  sl.registerFactory(
    () => DashboardBloc(
      getCitizenDashboardStatsUseCase: sl<GetCitizenDashboardStatsUseCase>(),
    ),
  );

  // ---------------------------------------------------------------------------
  // Premium / Payments Feature
  // ---------------------------------------------------------------------------
  sl.registerLazySingleton<PaymentRemoteDataSource>(
    () => PaymentRemoteDataSourceImpl(apiClient: sl<ApiClient>()),
  );

  sl.registerLazySingleton<PaymentRepository>(
    () => PaymentRepositoryImpl(
      remoteDataSource: sl<PaymentRemoteDataSource>(),
      networkInfo: sl<NetworkInfo>(),
    ),
  );

  sl.registerLazySingleton(
    () => CreateCheckoutSessionUseCase(sl<PaymentRepository>()),
  );
  sl.registerLazySingleton(
    () => VerifyPaymentSuccessUseCase(sl<PaymentRepository>()),
  );

  // ---------------------------------------------------------------------------
  // Staff Feature
  // ---------------------------------------------------------------------------
  sl.registerLazySingleton<StaffRemoteDataSource>(
    () => StaffRemoteDataSourceImpl(apiClient: sl<ApiClient>()),
  );

  sl.registerLazySingleton<StaffRepository>(
    () => StaffRepositoryImpl(
      remoteDataSource: sl<StaffRemoteDataSource>(),
      networkInfo: sl<NetworkInfo>(),
    ),
  );

  sl.registerLazySingleton(
    () => GetStaffAssignedTasksUseCase(sl<StaffRepository>()),
  );
  sl.registerLazySingleton(
    () => UpdateIssueStatusUseCase(sl<StaffRepository>()),
  );
  sl.registerLazySingleton(
    () => GetStaffDashboardStatsUseCase(sl<StaffRepository>()),
  );

  // ---------------------------------------------------------------------------
  // Admin Feature
  // ---------------------------------------------------------------------------
  sl.registerLazySingleton<AdminRemoteDataSource>(
    () => AdminRemoteDataSourceImpl(apiClient: sl<ApiClient>()),
  );

  sl.registerLazySingleton<AdminRepository>(
    () => AdminRepositoryImpl(
      remoteDataSource: sl<AdminRemoteDataSource>(),
      networkInfo: sl<NetworkInfo>(),
    ),
  );

  sl.registerLazySingleton(() => GetAllUsersUseCase(sl<AdminRepository>()));
  sl.registerLazySingleton(() => ToggleBlockUserUseCase(sl<AdminRepository>()));
  sl.registerLazySingleton(() => GetStaffsUseCase(sl<AdminRepository>()));
  sl.registerLazySingleton(() => AddStaffUseCase(sl<AdminRepository>()));
  sl.registerLazySingleton(
    () => GetAllAdminIssuesUseCase(sl<AdminRepository>()),
  );
  sl.registerLazySingleton(() => AssignIssueUseCase(sl<AdminRepository>()));
  sl.registerLazySingleton(
    () => GetAdminDashboardStatsUseCase(sl<AdminRepository>()),
  );
}
