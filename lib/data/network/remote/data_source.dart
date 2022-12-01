

import 'package:e_cm/data/models/movie/movie.dart';

abstract class DataSource {
  Future<List<Movie>> getMovie();
}