import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_order.freezed.dart';
part 'product_order.g.dart';

@freezed
class ProductOrder with _$ProductOrder {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory ProductOrder({
    required String productId,
    required int quantity,
  }) = _ProductOrder;



  factory ProductOrder.fromJson(Map<String, dynamic> json) =>
      _$ProductOrderFromJson(json);
}