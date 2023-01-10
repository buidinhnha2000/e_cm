//
// import 'package:e_cm/data/models/product/product_order.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
//
// import '../product/product.dart';
//
// part 'order.freezed.dart';
// part 'order.g.dart';
//
// @freezed
// class Order with _$Order {
//   const factory Order({
//     @JsonKey(name: '_id') required String idOrder,
//     required Product products,
//     required ProductOrder productOrders,
//     required String userId,
//     required int amount,
//     required String address,
//     required String status,
//   }) = _Order;
//
//
//
//   factory Order.fromJson(Map<String, dynamic> json) =>
//       _$OrderFromJson(json);
// }