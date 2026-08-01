import 'dart:async';
import 'dart:convert';
import 'dart:developer' as developer;
import 'dart:io';

import 'package:http/http.dart' as http;

import '../constants/api_constants.dart';
import '../exceptions/exceptions.dart';
import 'api_client.dart';
import 'auth_token_provider.dart';

/// Implementation of [ApiClient] using package:http.
class HttpApiClient implements ApiClient {
  final http.Client _client;
  final AuthTokenProvider? _tokenProvider;

  HttpApiClient({
    http.Client? client,
    AuthTokenProvider? tokenProvider,
  })  : _client = client ?? http.Client(),
        _tokenProvider = tokenProvider;

  @override
  Future<dynamic> get(
    String path, {
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    bool requiresAuth = true,
  }) async {
    final uri = _buildUri(path, queryParameters);
    final requestHeaders = await _buildHeaders(headers, requiresAuth);

    developer.log('GET -> $uri', name: 'HttpApiClient');

    try {
      final response = await _client
          .get(uri, headers: requestHeaders)
          .timeout(ApiConstants.timeout);

      return _processResponse(response);
    } on SocketException catch (e) {
      developer.log('Network error: $e', name: 'HttpApiClient', error: e);
      throw NetworkException('No internet connection.');
    } on TimeoutException catch (e) {
      developer.log('Request timeout: $e', name: 'HttpApiClient', error: e);
      throw NetworkException('Request timed out. Please try again.');
    } on http.ClientException catch (e) {
      developer.log('Client exception: $e', name: 'HttpApiClient', error: e);
      throw NetworkException('Network client error occurred.');
    }
  }

  @override
  Future<dynamic> post(
    String path, {
    Map<String, String>? headers,
    Object? body,
    bool requiresAuth = true,
  }) async {
    final uri = _buildUri(path, null);
    final requestHeaders = await _buildHeaders(headers, requiresAuth);
    final encodedBody = body != null ? jsonEncode(body) : null;

    developer.log('POST -> $uri', name: 'HttpApiClient');

    try {
      final response = await _client
          .post(uri, headers: requestHeaders, body: encodedBody)
          .timeout(ApiConstants.timeout);

      return _processResponse(response);
    } on SocketException catch (e) {
      developer.log('Network error: $e', name: 'HttpApiClient', error: e);
      throw NetworkException('No internet connection.');
    } on TimeoutException catch (e) {
      developer.log('Request timeout: $e', name: 'HttpApiClient', error: e);
      throw NetworkException('Request timed out. Please try again.');
    } on http.ClientException catch (e) {
      developer.log('Client exception: $e', name: 'HttpApiClient', error: e);
      throw NetworkException('Network client error occurred.');
    }
  }

  @override
  Future<dynamic> patch(
    String path, {
    Map<String, String>? headers,
    Object? body,
    bool requiresAuth = true,
  }) async {
    final uri = _buildUri(path, null);
    final requestHeaders = await _buildHeaders(headers, requiresAuth);
    final encodedBody = body != null ? jsonEncode(body) : null;

    developer.log('PATCH -> $uri', name: 'HttpApiClient');

    try {
      final response = await _client
          .patch(uri, headers: requestHeaders, body: encodedBody)
          .timeout(ApiConstants.timeout);

      return _processResponse(response);
    } on SocketException catch (e) {
      developer.log('Network error: $e', name: 'HttpApiClient', error: e);
      throw NetworkException('No internet connection.');
    } on TimeoutException catch (e) {
      developer.log('Request timeout: $e', name: 'HttpApiClient', error: e);
      throw NetworkException('Request timed out. Please try again.');
    } on http.ClientException catch (e) {
      developer.log('Client exception: $e', name: 'HttpApiClient', error: e);
      throw NetworkException('Network client error occurred.');
    }
  }

  @override
  Future<dynamic> delete(
    String path, {
    Map<String, String>? headers,
    Object? body,
    bool requiresAuth = true,
  }) async {
    final uri = _buildUri(path, null);
    final requestHeaders = await _buildHeaders(headers, requiresAuth);
    final encodedBody = body != null ? jsonEncode(body) : null;

    developer.log('DELETE -> $uri', name: 'HttpApiClient');

    try {
      final response = await _client
          .delete(uri, headers: requestHeaders, body: encodedBody)
          .timeout(ApiConstants.timeout);

      return _processResponse(response);
    } on SocketException catch (e) {
      developer.log('Network error: $e', name: 'HttpApiClient', error: e);
      throw NetworkException('No internet connection.');
    } on TimeoutException catch (e) {
      developer.log('Request timeout: $e', name: 'HttpApiClient', error: e);
      throw NetworkException('Request timed out. Please try again.');
    } on http.ClientException catch (e) {
      developer.log('Client exception: $e', name: 'HttpApiClient', error: e);
      throw NetworkException('Network client error occurred.');
    }
  }

  /// Builds absolute [Uri] combining base URL and query parameters.
  Uri _buildUri(String path, Map<String, dynamic>? queryParameters) {
    final fullPath = path.startsWith('http')
        ? path
        : '${ApiConstants.baseUrl}${path.startsWith('/') ? path : '/$path'}';

    final uri = Uri.parse(fullPath);

    if (queryParameters == null || queryParameters.isEmpty) {
      return uri;
    }

    final queryMap = <String, String>{};
    queryParameters.forEach((key, value) {
      if (value != null) {
        queryMap[key] = value.toString();
      }
    });

    return uri.replace(queryParameters: {
      ...uri.queryParameters,
      ...queryMap,
    });
  }

  /// Constructs standard JSON headers with optional Authorization bearer token.
  Future<Map<String, String>> _buildHeaders(
    Map<String, String>? customHeaders,
    bool requiresAuth,
  ) async {
    final headers = <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      ...?customHeaders,
    };

    if (requiresAuth && _tokenProvider != null) {
      final token = await _tokenProvider.getAuthToken();
      if (token != null && token.isNotEmpty) {
        headers['Authorization'] = 'Bearer $token';
      }
    }

    return headers;
  }

  /// Evaluates HTTP response status code and parses response body.
  dynamic _processResponse(http.Response response) {
    developer.log(
      'Response [${response.statusCode}] <- ${response.request?.url}',
      name: 'HttpApiClient',
    );

    final statusCode = response.statusCode;
    final responseBody = response.body;

    dynamic parsedData;
    if (responseBody.isNotEmpty) {
      try {
        parsedData = jsonDecode(responseBody);
      } catch (_) {
        parsedData = responseBody;
      }
    }

    if (statusCode >= 200 && statusCode < 300) {
      return parsedData;
    }

    final errorMessage = parsedData is Map && parsedData.containsKey('message')
        ? parsedData['message'].toString()
        : responseBody.isNotEmpty
            ? responseBody
            : 'HTTP Error $statusCode';

    switch (statusCode) {
      case 400:
        throw BadRequestException(errorMessage, statusCode);
      case 401:
      case 403:
        throw UnauthorizedException(errorMessage, statusCode);
      case 404:
        throw NotFoundException(errorMessage, statusCode);
      default:
        throw ServerException(errorMessage, statusCode);
    }
  }
}
