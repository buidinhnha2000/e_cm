// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      idUser: json['_id'] as String?,
      username: json['username'] as String?,
      password: json['password'] as String?,
      isAdmin: json['isAdmin'] as bool?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      '_id': instance.idUser,
      'username': instance.username,
      'password': instance.password,
      'isAdmin': instance.isAdmin,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
