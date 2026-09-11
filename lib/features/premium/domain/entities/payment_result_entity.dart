import 'package:equatable/equatable.dart';

/// Pure domain entity representing payment verification status.
class PaymentResultEntity extends Equatable {
  final bool success;
  final String transactionId;
  final String? message;
  final String? userEmail;

  const PaymentResultEntity({
    required this.success,
    required this.transactionId,
    this.message,
    this.userEmail,
  });

  @override
  List<Object?> get props => [success, transactionId, message, userEmail];
}
