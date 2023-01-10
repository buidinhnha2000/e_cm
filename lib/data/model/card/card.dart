import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'card.freezed.dart';
part 'card.g.dart';

@freezed
class CardDetailModel with _$CardDetailModel {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory CardDetailModel({
    String? cardId,
    String? email,
    int? numberCard,
    String? dateExpiry,
    int? cvc,
    String? city,
    int? zip,
  }) = _CardDetailModel;



  factory CardDetailModel.fromJson(Map<String, dynamic> json) =>
      _$CardDetailModelFromJson(json);
}