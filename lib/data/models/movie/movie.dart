import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie.freezed.dart';
part 'movie.g.dart';

@freezed
class Movie with _$Movie {
  const factory Movie({
    required String id,
    required String name,
    required String img,
    required String content,
    required String linktrailer,
    required String thumburl,
    required String time,
    required String episodetotal,
    required String actor,
    required String quality,
    required String year,
    required String top,
    required List<Tap> tap,

  }) = _Movie;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}


@freezed
class Tap with _$Tap {
  const factory Tap({
    required String nametap,
    required String contenttap,
    required String ghichutap,
    required String imgtap,
    required String videotap,
  }) = _Tap;



  factory Tap.fromJson(Map<String, dynamic> json) =>
      _$TapFromJson(json);
}