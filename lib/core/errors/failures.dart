import 'package:equatable/equatable.dart';

/// Base Failure class representing domain-level errors.
abstract class Failure extends Equatable {
  final String message;
  final int? statusCode;

  const Failure(this.message, [this.statusCode]);

  @override
  List<Object?> get props => [message, statusCode];
}

/// Domain failure representing 5xx server issues.
class ServerFailure extends Failure {
  const ServerFailure([super.message = 'Server error occurred.', super.statusCode]);
}

/// Domain failure representing 401/403 authorization failures.
class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure([super.message = 'Unauthorized access.', super.statusCode = 401]);
}

/// Domain failure representing 400 bad request errors.
class BadRequestFailure extends Failure {
  const BadRequestFailure([super.message = 'Invalid request parameters.', super.statusCode = 400]);
}

/// Domain failure representing 404 resource not found errors.
class NotFoundFailure extends Failure {
  const NotFoundFailure([super.message = 'Requested resource not found.', super.statusCode = 404]);
}

/// Domain failure representing offline status or network connection timeouts.
class NetworkFailure extends Failure {
  const NetworkFailure([super.message = 'Please check your internet connection.']);
}

/// Fallback domain failure for unhandled exceptions.
class UnknownFailure extends Failure {
  const UnknownFailure([super.message = 'An unexpected error occurred.']);
}
