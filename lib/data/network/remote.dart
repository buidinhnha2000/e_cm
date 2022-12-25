import 'package:dio/dio.dart';
import 'package:e_cm/data/models/movie/movie.dart';
import 'package:e_cm/data/network/remote/data_source.dart';
import 'package:e_cm/data/network/network.dart';
import '../models/product/product.dart';

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

  @override
  Future<List<Product>> getProduct() async {
    try{
      final response = await dio.get('http://10.10.10.92:6001/api/products');
      // print(response);
      final List<dynamic> jsonProduct = response.data as List<dynamic>;
      final products = jsonProduct.map((e) => Product.fromJson(e)).toList();
      return products;
    } catch (e) {
      // print(e);
      throw e;
    }
  }
}