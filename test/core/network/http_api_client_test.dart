import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

import 'package:zapshift/core/constants/api_constants.dart';
import 'package:zapshift/core/exceptions/exceptions.dart';
import 'package:zapshift/core/network/auth_token_provider.dart';
import 'package:zapshift/core/network/http_api_client.dart';

class FakeAuthTokenProvider implements AuthTokenProvider {
  final String? token;
  FakeAuthTokenProvider([this.token = 'fake_firebase_token']);

  @override
  Future<String?> getAuthToken() async => token;
}

void main() {
  group('HttpApiClient Tests', () {
    late FakeAuthTokenProvider fakeTokenProvider;

    setUp(() {
      fakeTokenProvider = FakeAuthTokenProvider();
    });

    test('GET request successfully parses plain text response (Health Check)', () async {
      final mockClient = MockClient((request) async {
        expect(request.url.toString(), '${ApiConstants.baseUrl}/');
        expect(request.method, 'GET');
        return http.Response('"server is live"', 200);
      });

      final apiClient = HttpApiClient(
        client: mockClient,
        tokenProvider: fakeTokenProvider,
      );

      final response = await apiClient.get(ApiConstants.health, requiresAuth: false);
      expect(response, 'server is live');
    });

    test('POST request injects Authorization header and parses JSON response', () async {
      final mockClient = MockClient((request) async {
        expect(request.url.toString(), '${ApiConstants.baseUrl}/issues');
        expect(request.headers['Authorization'], 'Bearer fake_firebase_token');
        expect(request.headers['Content-Type'], 'application/json');
        expect(request.method, 'POST');

        final body = jsonDecode(request.body);
        expect(body['title'], 'Broken Streetlight');

        return http.Response(
          jsonEncode({'id': '123', 'status': 'pending'}),
          201,
        );
      });

      final apiClient = HttpApiClient(
        client: mockClient,
        tokenProvider: fakeTokenProvider,
      );

      final response = await apiClient.post(
        ApiConstants.issues,
        body: {'title': 'Broken Streetlight'},
        requiresAuth: true,
      );

      expect(response, isA<Map<String, dynamic>>());
      expect(response['id'], '123');
      expect(response['status'], 'pending');
    });

    test('401 response throws UnauthorizedException', () async {
      final mockClient = MockClient((request) async {
        return http.Response(jsonEncode({'message': 'Invalid token'}), 401);
      });

      final apiClient = HttpApiClient(
        client: mockClient,
        tokenProvider: fakeTokenProvider,
      );

      expect(
        () => apiClient.get(ApiConstants.myIssues),
        throwsA(isA<UnauthorizedException>()),
      );
    });

    test('400 response throws BadRequestException', () async {
      final mockClient = MockClient((request) async {
        return http.Response(jsonEncode({'message': 'Title required'}), 400);
      });

      final apiClient = HttpApiClient(
        client: mockClient,
        tokenProvider: fakeTokenProvider,
      );

      expect(
        () => apiClient.post(ApiConstants.issues, body: {}),
        throwsA(isA<BadRequestException>()),
      );
    });

    test('500 response throws ServerException', () async {
      final mockClient = MockClient((request) async {
        return http.Response('Internal Server Error', 500);
      });

      final apiClient = HttpApiClient(
        client: mockClient,
        tokenProvider: fakeTokenProvider,
      );

      expect(
        () => apiClient.get(ApiConstants.allIssues),
        throwsA(isA<ServerException>()),
      );
    });
  });
}
