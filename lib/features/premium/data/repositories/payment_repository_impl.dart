import '../../../../core/errors/failures.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/checkout_session_entity.dart';
import '../../domain/entities/payment_result_entity.dart';
import '../../domain/repositories/payment_repository.dart';
import '../datasources/payment_remote_datasource.dart';

/// Concrete implementation of PaymentRepository bridging network and domain.
class PaymentRepositoryImpl implements PaymentRepository {
  final PaymentRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  const PaymentRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<(Failure?, CheckoutSessionEntity?)> createCheckoutSession() async {
    if (!await networkInfo.isConnected) {
      return (const NetworkFailure('No internet connection'), null);
    }
    try {
      final session = await remoteDataSource.createCheckoutSession();
      return (null, session);
    } on AppException catch (e) {
      return (ServerFailure(e.message, e.statusCode), null);
    } catch (e) {
      return (ServerFailure('Checkout session error: $e'), null);
    }
  }

  @override
  Future<(Failure?, PaymentResultEntity?)> verifyPaymentSuccess(
    String sessionId,
  ) async {
    if (!await networkInfo.isConnected) {
      return (const NetworkFailure('No internet connection'), null);
    }
    try {
      final result = await remoteDataSource.verifyPaymentSuccess(sessionId);
      return (null, result);
    } on AppException catch (e) {
      return (ServerFailure(e.message, e.statusCode), null);
    } catch (e) {
      return (ServerFailure('Payment verification error: $e'), null);
    }
  }
}
