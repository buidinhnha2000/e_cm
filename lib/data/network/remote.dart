
import 'package:dio/dio.dart';
import 'package:e_cm/data/models/movie/movie.dart';
import 'package:e_cm/data/network/remote/data_source.dart';
import 'package:e_cm/data/network/network.dart';

class GetDataSource extends DataSource {
  @override
  Future<List<Movie>> getMovie() async {
    try {
      final response = await dio.get('https://62f25a6db1098f15081104e2.mockapi.io/api/v1/movie');
      final List<dynamic> jsonMovie = response.data as List<dynamic>;
      final movies = jsonMovie.map((e) => Movie.fromJson(e)).toList();
      return movies;
    } on DioError catch (e) {
      throw e.error;
    }
  }
}