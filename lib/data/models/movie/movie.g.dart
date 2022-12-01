// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Movie _$$_MovieFromJson(Map<String, dynamic> json) => _$_Movie(
      id: json['id'] as String,
      name: json['name'] as String,
      img: json['img'] as String,
      content: json['content'] as String,
      linktrailer: json['linktrailer'] as String,
      thumburl: json['thumburl'] as String,
      time: json['time'] as String,
      episodetotal: json['episodetotal'] as String,
      actor: json['actor'] as String,
      quality: json['quality'] as String,
      year: json['year'] as String,
      top: json['top'] as String,
      tap: (json['tap'] as List<dynamic>)
          .map((e) => Tap.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_MovieToJson(_$_Movie instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'img': instance.img,
      'content': instance.content,
      'linktrailer': instance.linktrailer,
      'thumburl': instance.thumburl,
      'time': instance.time,
      'episodetotal': instance.episodetotal,
      'actor': instance.actor,
      'quality': instance.quality,
      'year': instance.year,
      'top': instance.top,
      'tap': instance.tap,
    };

_$_Tap _$$_TapFromJson(Map<String, dynamic> json) => _$_Tap(
      nametap: json['nametap'] as String,
      contenttap: json['contenttap'] as String,
      ghichutap: json['ghichutap'] as String,
      imgtap: json['imgtap'] as String,
      videotap: json['videotap'] as String,
    );

Map<String, dynamic> _$$_TapToJson(_$_Tap instance) => <String, dynamic>{
      'nametap': instance.nametap,
      'contenttap': instance.contenttap,
      'ghichutap': instance.ghichutap,
      'imgtap': instance.imgtap,
      'videotap': instance.videotap,
    };
