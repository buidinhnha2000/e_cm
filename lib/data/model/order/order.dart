import 'package:e_cm/data/model/product/product.dart';
import 'package:e_cm/data/model/product/product_order.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order.freezed.dart';
part 'order.g.dart';

@freezed
class Order with _$Order {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory Order({
    @JsonKey(name: '_id') required String orderId,
    required Product products,
    required ProductOrder productOrders,
    required String userId,
    required int amount,
    required String address,
    required String status,
  }) = _Order;
  
  

  factory Order.fromJson(Map<String, dynamic> json) =>
      _$OrderFromJson(json);
}