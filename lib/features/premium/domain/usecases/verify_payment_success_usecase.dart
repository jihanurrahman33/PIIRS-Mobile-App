import '../../../../core/errors/failures.dart';
import '../entities/payment_result_entity.dart';
import '../repositories/payment_repository.dart';

/// UseCase to confirm payment completion and activate user premium status.
class VerifyPaymentSuccessUseCase {
  final PaymentRepository repository;

  const VerifyPaymentSuccessUseCase(this.repository);

  Future<(Failure?, PaymentResultEntity?)> call(String sessionId) =>
      repository.verifyPaymentSuccess(sessionId);
}
