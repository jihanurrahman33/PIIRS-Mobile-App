import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Keys used for storing sensitive token & user credentials in encrypted storage.
abstract class SecureStorageKeys {
  static const String authToken = 'auth_token';
  static const String refreshToken = 'refresh_token';
  static const String userId = 'user_id';
  static const String userEmail = 'user_email';
  static const String userRole = 'user_role';
}

/// Abstract contract for encrypted local storage.
abstract class SecureStorageService {
  Future<void> write({required String key, required String value});
  Future<String?> read({required String key});
  Future<void> delete({required String key});
  Future<void> clearAll();
}

/// Production implementation of [SecureStorageService] using [FlutterSecureStorage].
class FlutterSecureStorageService implements SecureStorageService {
  final FlutterSecureStorage _storage;

  FlutterSecureStorageService({FlutterSecureStorage? storage})
      : _storage = storage ??
            const FlutterSecureStorage(
              aOptions: AndroidOptions(
                encryptedSharedPreferences: true,
              ),
              iOptions: IOSOptions(
                accessibility: KeychainAccessibility.first_unlock,
              ),
            );

  @override
  Future<void> write({required String key, required String value}) async {
    await _storage.write(key: key, value: value);
  }

  @override
  Future<String?> read({required String key}) async {
    return await _storage.read(key: key);
  }

  @override
  Future<void> delete({required String key}) async {
    await _storage.delete(key: key);
  }

  @override
  Future<void> clearAll() async {
    await _storage.deleteAll();
  }
}
