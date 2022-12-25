
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    @JsonKey(name: '_id') required String idUser,
    required String username,
    required String password,
    required bool isAdmin,
    required String createdAt,
    required String updatedAt,
  }) = _User;



  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);
}


