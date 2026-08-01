import 'package:flutter_test/flutter_test.dart';
import 'package:zapshift/core/config/env_config.dart';
import 'package:zapshift/core/constants/api_constants.dart';
import 'package:zapshift/core/network/secure_storage_auth_token_provider.dart';
import 'package:zapshift/core/services/secure_storage_service.dart';
import 'package:zapshift/core/utils/validators.dart';

class MockSecureStorageService implements SecureStorageService {
  final Map<String, String> _storage = {};

  @override
  Future<void> write({required String key, required String value}) async {
    _storage[key] = value;
  }

  @override
  Future<String?> read({required String key}) async {
    return _storage[key];
  }

  @override
  Future<void> delete({required String key}) async {
    _storage.remove(key);
  }

  @override
  Future<void> clearAll() async {
    _storage.clear();
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('EnvConfig Tests', () {
    test('EnvConfig returns non-empty default baseUrl and environment', () {
      expect(EnvConfig.baseUrl, isNotEmpty);
      expect(ApiConstants.baseUrl, equals(EnvConfig.baseUrl));
      expect(EnvConfig.environment, isNotEmpty);
    });
  });

  group('Validators Tests', () {
    test('validateEmail validates correctly', () {
      expect(Validators.validateEmail('user@domain.com'), isNull);
      expect(Validators.validateEmail('invalid-email'), isNotNull);
      expect(Validators.validateEmail(''), isNotNull);
      expect(Validators.validateEmail(null), isNotNull);
    });

    test('validatePassword validates correctly', () {
      expect(Validators.validatePassword('secret123'), isNull);
      expect(Validators.validatePassword('123'), isNotNull);
      expect(Validators.validatePassword(''), isNotNull);
      expect(Validators.validatePassword(null), isNotNull);
    });

    test('validateName validates correctly', () {
      expect(Validators.validateName('John Doe'), isNull);
      expect(Validators.validateName('A'), isNotNull);
      expect(Validators.validateName(''), isNotNull);
    });

    test('sanitizeInput strips HTML tags', () {
      expect(
        Validators.sanitizeInput('<script>alert("xss")</script>Hello'),
        equals('alert("xss")Hello'),
      );
    });
  });

  group('SecureStorageAuthTokenProvider Tests', () {
    test('retrieves stored auth token securely', () async {
      final mockStorage = MockSecureStorageService();
      await mockStorage.write(
        key: SecureStorageKeys.authToken,
        value: 'my_secure_jwt_token',
      );

      final tokenProvider = SecureStorageAuthTokenProvider(
        storageService: mockStorage,
      );

      final token = await tokenProvider.getAuthToken();
      expect(token, equals('my_secure_jwt_token'));
    });
  });
}
