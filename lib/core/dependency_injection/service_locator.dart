import 'package:get_it/get_it.dart';

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
}
