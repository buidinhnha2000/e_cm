import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rating.freezed.dart';

part 'rating.g.dart';

@freezed
class Rating with _$Rating {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory Rating({
    @JsonKey(name: '_id') required String ratingId,
    String? userId,
    String? productId,
    String? response,
    int? rating,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Rating;

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);
}
