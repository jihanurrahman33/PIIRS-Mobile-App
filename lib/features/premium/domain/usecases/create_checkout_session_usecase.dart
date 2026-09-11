import '../../../../core/errors/failures.dart';
import '../entities/checkout_session_entity.dart';
import '../repositories/payment_repository.dart';

/// UseCase to initiate a Stripe checkout session for premium membership.
class CreateCheckoutSessionUseCase {
  final PaymentRepository repository;

  const CreateCheckoutSessionUseCase(this.repository);

  Future<(Failure?, CheckoutSessionEntity?)> call() =>
      repository.createCheckoutSession();
}
