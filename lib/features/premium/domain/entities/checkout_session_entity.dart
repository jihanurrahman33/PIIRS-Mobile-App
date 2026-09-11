import 'package:equatable/equatable.dart';

/// Pure domain entity representing a Stripe checkout session.
class CheckoutSessionEntity extends Equatable {
  final String id;
  final String url;

  const CheckoutSessionEntity({required this.id, required this.url});

  @override
  List<Object?> get props => [id, url];
}
