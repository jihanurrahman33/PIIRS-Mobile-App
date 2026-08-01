import 'package:get_it/get_it.dart';

import '../network/api_client.dart';
import '../network/http_api_client.dart';
import '../network/network_info.dart';

/// Global dependency injection container instance.
final sl = GetIt.instance;

/// Sets up global singletons and factories.
Future<void> setupServiceLocator() async {
  // ---------------------------------------------------------------------------
  // Core Network & Services
  // ---------------------------------------------------------------------------
  sl.registerLazySingleton<NetworkInfo>(
    () => SimpleNetworkInfo(),
  );

  sl.registerLazySingleton<ApiClient>(
    () => HttpApiClient(),
  );
}
