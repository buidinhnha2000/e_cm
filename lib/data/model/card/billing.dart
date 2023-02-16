import 'package:flutter/foundation.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'billing.freezed.dart';
part 'billing.g.dart';

@freezed
class BillingDetailModel with _$BillingDetailModel {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory BillingDetailModel({
    String? email,
    Address? address,
    String? phone,
    String? name,
    double? price,
  }) = _BillingDetailModel;

  factory BillingDetailModel.fromJson(Map<String, dynamic> json) =>
      _$BillingDetailModelFromJson(json);
}