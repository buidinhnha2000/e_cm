import 'package:freezed_annotation/freezed_annotation.dart';
part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class Product with _$Product {
  const factory Product({
    @JsonKey(name: "_id") required String idProduct,
    required String title,
    required String desc,
    required String img,
    required int amount,
    required int sold,
    required int like,
    required List<String> categories,
    required List<String> size,
    required List<String> color,
    required int price,
    required bool inStock,
    required String createdAt,
    required String updatedAt,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}
