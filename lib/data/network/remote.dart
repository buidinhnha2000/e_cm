import 'package:dio/dio.dart';
import 'package:e_cm/data/model/address/address.dart';
import 'package:e_cm/data/model/order/order.dart';
import 'package:e_cm/data/model/payment/payment.dart';
import 'package:e_cm/data/model/rating/rating.dart';
import 'package:e_cm/data/models/movie/movie.dart';
import 'package:e_cm/data/network/helper/secure_storage.dart';
import 'package:e_cm/data/network/remote/data_source.dart';
import 'package:e_cm/data/network/network.dart';
import 'package:e_cm/data/network/services/urls.dart';
import '../model/cart/cart.dart';
import '../model/categories/categories.dart';
import '../model/product/product.dart';

class GetDataSource extends DataSource {
  @override
  Future<List<Movie>> getMovie() async {
    try {
      final response = await dio
          .get('https://62f25a6db1098f15081104e2.mockapi.io/api/v1/movie');
      final List<dynamic> jsonMovie = response.data as List<dynamic>;
      final movies = jsonMovie.map((e) => Movie.fromJson(e)).toList();
      return movies;
    } on DioError catch (e) {
      throw e.error;
    }
  }

  @override
  Future<List<Product>> getProduct() async {
    try {
      final response = await dio.get('${URLS.urlApi}/products');
      final List<dynamic> jsonProduct = response.data as List<dynamic>;
      final products = jsonProduct.map((e) => Product.fromJson(e)).toList();
      return products;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Future<List<Categories>> getCategories() async {
    try {
      final response = await dio.get('${URLS.urlApi}/categories');
      final List<dynamic> jsonCategories = response.data as List<dynamic>;
      final categories =
          jsonCategories.map((e) => Categories.fromJson(e)).toList();
      return categories;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Rating>> getRating({required String productId}) async {
    try {
      final response = await dio.get('${URLS.urlApi}/rating/find/$productId');
      print(response.data);
      final ratings = (response.data as List<dynamic>).map(
        (e) {
          return Rating(
            ratingId: 'aaa',
            userId: e['userId'].toString(),
            productId: e['productId'].toString(),
            rating: e['rating'],
            response: e['response'],
            createdAt: DateTime.tryParse(e['createdAt'].toString()),
          );
        },
      ).toList();
      return ratings;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<List<Order>> getOrder() async {
    try {
      final response = await dio.get('${URLS.urlApi}/orders');
      final List<dynamic> jsonOrder = response.data as List<dynamic>;
      final orders = jsonOrder.map((e) => Order.fromJson(e)).toList();
      return orders;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

// ID
  @override
  Future<List<Cart>> getCart() async {
    try {
      final userId = await secureStorage.getUserId();
      final response = await dio.get('${URLS.urlApi}/cart/find/$userId');
      final List<dynamic> jsonCart = response.data as List<dynamic>;
      final carts = jsonCart.map((e) => Cart.fromJson(e)).toList();
      return carts;
    } on Error catch (e) {
      print(e.stackTrace);
      rethrow;
    }
  }

  Future<List<Product>> getProductId() async {
    try {
      final productId = await secureStorage.getUserId();
      final response = await dio.get('${URLS.urlApi}/products/find/$productId');
      final List<dynamic> jsonProduct = response.data as List<dynamic>;
      final products = jsonProduct.map((e) => Product.fromJson(e)).toList();
      return products;
    } on Error catch (e) {
      print(e.stackTrace);
      rethrow;
    }
  }

  Future<List<Address>> getAddressId() async {
    try {
      final userId = await secureStorage.getUserId();
      final response = await dio.get('${URLS.urlApi}/address/find/$userId');
      final List<dynamic> jsonAddress = response.data as List<dynamic>;
      final address = jsonAddress.map((e) => Address.fromJson(e)).toList();
      return address;
    } on Error catch (e) {
      print(e.stackTrace);
      rethrow;
    }
  }

  Future<List<Payment>> getPaymentId() async {
    try{
      final userId = await secureStorage.getUserId();
      final response = await dio.get('${URLS.urlApi}/payments/find/$userId');
      final List<dynamic> jsonPayment = response.data as List<dynamic>;
      final payments= jsonPayment.map((e) => Payment.fromJson(e)).toList();
      return payments;
    } on Error catch (e) {
      print(e.stackTrace);
      rethrow;
    }
  }
}
