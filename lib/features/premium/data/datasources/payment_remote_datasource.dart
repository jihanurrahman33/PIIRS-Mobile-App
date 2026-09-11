import '../models/checkout_session_model.dart';
import '../models/payment_result_model.dart';

/// Remote data source contract for Stripe payment endpoints.
abstract class PaymentRemoteDataSource {
  Future<CheckoutSessionModel> createCheckoutSession();
  Future<PaymentResultModel> verifyPaymentSuccess(String sessionId);
}
