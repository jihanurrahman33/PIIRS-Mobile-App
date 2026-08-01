/// Abstract contract defining HTTP operations for the application.
abstract class ApiClient {
  /// Performs an HTTP GET request returning a JSON object or string payload.
  Future<dynamic> get(
    String path, {
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    bool requiresAuth = true,
  });

  /// Performs an HTTP POST request.
  Future<dynamic> post(
    String path, {
    Map<String, String>? headers,
    Object? body,
    bool requiresAuth = true,
  });

  /// Performs an HTTP PATCH request.
  Future<dynamic> patch(
    String path, {
    Map<String, String>? headers,
    Object? body,
    bool requiresAuth = true,
  });

  /// Performs an HTTP DELETE request.
  Future<dynamic> delete(
    String path, {
    Map<String, String>? headers,
    Object? body,
    bool requiresAuth = true,
  });
}
