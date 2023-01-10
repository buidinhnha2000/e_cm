//
// import 'package:freezed_annotation/freezed_annotation.dart';
//
// part 'rating.freezed.dart';
// part 'rating.g.dart';
//
// @freezed
// class Rating with _$Rating {
//   @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
//   const factory Rating({
//     @JsonKey(name: '_id') required String idRating,
//     required String userId,
//     required String productId,
//     required String response,
//     required int rating,
//   }) = _Rating;
//
//
//
//   factory Rating.fromJson(Map<String, dynamic> json) =>
//       _$RatingFromJson(json);
// }