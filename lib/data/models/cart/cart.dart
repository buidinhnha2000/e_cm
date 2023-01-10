//
// import 'package:freezed_annotation/freezed_annotation.dart';
//
// import '../product/product.dart';
//
// part 'cart.freezed.dart';
// part 'cart.g.dart';
//
// @freezed
// class Cart with _$Cart {
//   const factory Cart({
//     required String userId,
//     @JsonKey(name: "productId") required Product product,
//     required int quantity,
//   }) = _Cart;
//
//   factory Cart.fromJson(Map<String, dynamic> json) =>_$CartFromJson(json);
// }