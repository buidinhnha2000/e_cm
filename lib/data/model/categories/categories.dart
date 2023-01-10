import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'categories.freezed.dart';
part 'categories.g.dart';

@freezed
class Categories with _$Categories {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory Categories({
    @JsonKey(name: '_id') required String categoriesId,
    required String? nameCate,
    required String? img,
    required String? cat,
  }) = _Categories;



  factory Categories.fromJson(Map<String, dynamic> json) =>
      _$CategoriesFromJson(json);
}