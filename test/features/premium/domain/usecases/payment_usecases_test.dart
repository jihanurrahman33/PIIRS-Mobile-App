import 'package:flutter_test/flutter_test.dart';
import 'package:zapshift/core/errors/failures.dart';
import 'package:zapshift/features/premium/domain/entities/checkout_session_entity.dart';
import 'package:zapshift/features/premium/domain/entities/payment_result_entity.dart';
import 'package:zapshift/features/premium/domain/repositories/payment_repository.dart';
import 'package:zapshift/features/premium/domain/usecases/create_checkout_session_usecase.dart';
import 'package:zapshift/features/premium/domain/usecases/verify_payment_success_usecase.dart';

class FakePaymentRepository implements PaymentRepository {
  @override
  Future<(Failure?, CheckoutSessionEntity?)> createCheckoutSession() async => (
    null,
    const CheckoutSessionEntity(id: 'cs_123', url: 'https://stripe.com/pay'),
  );

  @override
  Future<(Failure?, PaymentResultEntity?)> verifyPaymentSuccess(
    String sessionId,
  ) async {
    if (sessionId == 'valid_session') {
      return (
        null,
        const PaymentResultEntity(success: true, transactionId: 'pi_999'),
      );
    }
    return (const ServerFailure('Session not found'), null);
  }
}

void main() {
  late FakePaymentRepository repository;
  late CreateCheckoutSessionUseCase createCheckoutSessionUseCase;
  late VerifyPaymentSuccessUseCase verifyPaymentSuccessUseCase;

  setUp(() {
    repository = FakePaymentRepository();
    createCheckoutSessionUseCase = CreateCheckoutSessionUseCase(repository);
    verifyPaymentSuccessUseCase = VerifyPaymentSuccessUseCase(repository);
  });

  group('Payment UseCases Unit Tests', () {
    test('CreateCheckoutSessionUseCase returns session url and id', () async {
      final (failure, session) = await createCheckoutSessionUseCase();
      expect(failure, isNull);
      expect(session?.id, 'cs_123');
      expect(session?.url, 'https://stripe.com/pay');
    });

    test('VerifyPaymentSuccessUseCase confirms payment status', () async {
      final (failure, result) = await verifyPaymentSuccessUseCase(
        'valid_session',
      );
      expect(failure, isNull);
      expect(result?.success, isTrue);
      expect(result?.transactionId, 'pi_999');
    });

    test(
      'VerifyPaymentSuccessUseCase returns failure on invalid session',
      () async {
        final (failure, result) = await verifyPaymentSuccessUseCase(
          'invalid_session',
        );
        expect(failure, isA<ServerFailure>());
        expect(result, isNull);
      },
    );
  });
}
