/// Base class for all application exceptions thrown in data sources / network.
abstract class AppException implements Exception {
  final String message;
  final int? statusCode;

  const AppException(this.message, [this.statusCode]);

  @override
  String toString() => '$runtimeType: $message (StatusCode: $statusCode)';
}

/// Thrown when the server responds with a 5xx or unexpected error status code.
class ServerException extends AppException {
  const ServerException(
      [super.message = 'A server error occurred.', super.statusCode]);
}

/// Thrown when an unauthenticated (401) or unauthorized (403) request occurs.
class UnauthorizedException extends AppException {
  const UnauthorizedException(
      [super.message = 'Unauthorized request.', super.statusCode = 401]);
}

/// Thrown when the server returns a 400 Bad Request error.
class BadRequestException extends AppException {
  const BadRequestException(
      [super.message = 'Bad request.', super.statusCode = 400]);
}

/// Thrown when the requested resource (404) is not found.
class NotFoundException extends AppException {
  const NotFoundException(
      [super.message = 'Resource not found.', super.statusCode = 404]);
}

/// Thrown when internet connection is missing or request times out.
class NetworkException extends AppException {
  const NetworkException(
      [super.message = 'Network connectivity issue or request timeout.']);
}
