import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment.freezed.dart';
part 'payment.g.dart';

@freezed
class Payment with _$Payment {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory Payment({
    @JsonKey(name: '_id') required String? paymentId,
    String? userId,
    String? orderId,
    double? cardPrice,
    int? cardNumber,
    String? cardExpiration,
    int? cardCvc,
    int? cardZip,
    int? amount,
  }) = _Payment;

  factory Payment.fromJson(Map<String, dynamic> json) =>
      _$PaymentFromJson(json);
}