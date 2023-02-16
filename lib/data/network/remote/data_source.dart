import 'package:e_cm/data/models/movie/movie.dart';
import '../../model/cart/cart.dart';
import '../../model/categories/categories.dart';
import '../../model/product/product.dart';

abstract class DataSource {
  Future<List<Movie>> getMovie();
  Future<List<Product>> getProduct();
  Future<List<Cart>> getCart();
  Future<List<Categories>> getCategories();
}