import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../product/product.dart';

part 'cart.freezed.dart';
part 'cart.g.dart';

@freezed
class Cart with _$Cart {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory Cart({
    required String? userId,
    @JsonKey(name: "productId") required Product? product,
    required int? quantity,
  }) = _Cart;



  factory Cart.fromJson(Map<String, dynamic> json) =>
      _$CartFromJson(json);
}

@freezed
class CartProduct with _$CartProduct {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory CartProduct({
    required String? userId,
    @JsonKey(name: "productId") required String productId,
    required int? quantity,
  }) = _CartProduct;



  factory CartProduct.fromJson(Map<String, dynamic> json) =>
      _$CartProductFromJson(json);
}