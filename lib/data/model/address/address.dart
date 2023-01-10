import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'address.freezed.dart';
part 'address.g.dart';

@freezed
class Address with _$Address {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory Address({
    required String? userId,
    required String? name,
    required String? email,
    required int? phone,
    required String? address,
    required String? country,
    required String? city
  }) = _Address;



  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}