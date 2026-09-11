import '../../../../core/errors/failures.dart';
import '../entities/checkout_session_entity.dart';
import '../entities/payment_result_entity.dart';

/// Abstract domain repository for Stripe payment operations.
abstract class PaymentRepository {
  Future<(Failure?, CheckoutSessionEntity?)> createCheckoutSession();
  Future<(Failure?, PaymentResultEntity?)> verifyPaymentSuccess(
    String sessionId,
  );
}
