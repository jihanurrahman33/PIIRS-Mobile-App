import '../../../../core/constants/api_constants.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/network/api_client.dart';
import '../models/checkout_session_model.dart';
import '../models/payment_result_model.dart';
import 'payment_remote_datasource.dart';

/// Concrete implementation of PaymentRemoteDataSource using ApiClient.
class PaymentRemoteDataSourceImpl implements PaymentRemoteDataSource {
  final ApiClient apiClient;

  const PaymentRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<CheckoutSessionModel> createCheckoutSession() async {
    final res = await apiClient.post(ApiConstants.createCheckoutSession);
    if (res is Map<String, dynamic>) {
      return CheckoutSessionModel.fromJson(res);
    }
    throw const ServerException('Invalid checkout session response format.');
  }

  @override
  Future<PaymentResultModel> verifyPaymentSuccess(String sessionId) async {
    final res = await apiClient.patch(
      ApiConstants.paymentSuccess,
      queryParameters: {'session_id': sessionId},
      requiresAuth: false,
    );
    if (res is Map<String, dynamic>) {
      return PaymentResultModel.fromJson(res);
    }
    throw const ServerException('Invalid payment verification format.');
  }
}
