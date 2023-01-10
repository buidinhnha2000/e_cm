

import 'package:e_cm/data/models/category/categories.dart';
import 'package:e_cm/data/models/movie/movie.dart';
import 'package:e_cm/data/models/product/product.dart';
import '../../model/cart/cart.dart';
import '../../model/categories/categories.dart';
import '../../model/product/product.dart';
import '../../models/cart/cart.dart';

abstract class DataSource {
  Future<List<Movie>> getMovie();
  Future<List<Product>> getProduct();
  Future<List<Cart>> getCart();
  Future<List<Categories>> getCategories();
}