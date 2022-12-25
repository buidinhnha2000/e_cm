

import 'package:e_cm/data/models/movie/movie.dart';
import 'package:e_cm/data/models/product/product.dart';

abstract class DataSource {
  Future<List<Movie>> getMovie();
  Future<List<Product>> getProduct();
}