
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    @JsonKey(name: '_id')  String? idUser,
     String? username,
     String? password,
     bool? isAdmin,
     String? createdAt,
     String? updatedAt,
  }) = _User;



  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);
}


