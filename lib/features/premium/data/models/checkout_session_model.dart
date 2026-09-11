import '../../domain/entities/checkout_session_entity.dart';

/// Data model representing Stripe checkout session payload.
class CheckoutSessionModel extends CheckoutSessionEntity {
  const CheckoutSessionModel({required super.id, required super.url});

  factory CheckoutSessionModel.fromJson(Map<String, dynamic> json) =>
      CheckoutSessionModel(
        id: json['id']?.toString() ?? '',
        url: json['url']?.toString() ?? '',
      );

  Map<String, dynamic> toJson() => {'id': id, 'url': url};
}
