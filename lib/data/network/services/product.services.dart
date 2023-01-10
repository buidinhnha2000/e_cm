import 'package:dio/dio.dart';
import 'package:e_cm/data/network/services/urls.dart';
import '../../model/cart/cart.dart';

class ProductServices {
  Future<Cart> addProductToCart(String? userId, String productId) async {
    final resp = await Dio().post('${URLS.urlApi}/cart/',
        data: Map.from({
          'userId': userId,
          'productId': productId,
        })
    );

    return Cart.fromJson(resp.data);
  }

  Future<Cart> deleteProductToCart(String? userId, String productId) async {
    final resp = await Dio().delete('${URLS.urlApi}/api/cart',
        data: Map.from({
          'userId': userId,
          'productId': productId,
        }));

    return Cart.fromJson(resp.data);
  }

  Future<Cart> updateProductToCart(String? userId, String productId) async {
    final resp = await Dio().put('${URLS.urlApi}/api/cart',
        data: Map.from({
          'userId': userId,
          'productId': productId,
        }));

    return Cart.fromJson(resp.data);
  }

}
final productServices = ProductServices();