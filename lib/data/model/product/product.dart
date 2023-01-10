import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class Product with _$Product {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory Product({
    @JsonKey(name: '_id') required String productId,
    required String title,
    required String desc,
    required String img,
    required int? quantity,
    required int? sold,
    required int? like,
    required int? rating,
    required double? reviewscore,
    required List<String> categories,
    required List<String> size,
    required List<String> color,
    required double price,
    required bool? inStock,
  }) = _Product;



  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}