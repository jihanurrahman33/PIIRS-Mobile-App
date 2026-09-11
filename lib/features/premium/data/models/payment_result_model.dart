import '../../domain/entities/payment_result_entity.dart';

/// Data model for payment verification API response.
class PaymentResultModel extends PaymentResultEntity {
  const PaymentResultModel({
    required super.success,
    required super.transactionId,
    super.message,
    super.userEmail,
  });

  factory PaymentResultModel.fromJson(Map<String, dynamic> json) =>
      PaymentResultModel(
        success: json['success'] as bool? ?? json['message'] == 'already exist',
        transactionId: json['transactionId']?.toString() ?? '',
        message: json['message']?.toString(),
        userEmail: json['userEmail']?.toString(),
      );
}
