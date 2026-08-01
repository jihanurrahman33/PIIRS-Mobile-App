import '../services/secure_storage_service.dart';
import 'auth_token_provider.dart';

/// Implementation of [AuthTokenProvider] that retrieves JWT bearer tokens
/// from encrypted [SecureStorageService].
class SecureStorageAuthTokenProvider implements AuthTokenProvider {
  final SecureStorageService _storageService;

  SecureStorageAuthTokenProvider({
    required SecureStorageService storageService,
  }) : _storageService = storageService;

  @override
  Future<String?> getAuthToken() async {
    return await _storageService.read(key: SecureStorageKeys.authToken);
  }
}
