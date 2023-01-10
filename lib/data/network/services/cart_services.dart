import 'package:dio/dio.dart';
import 'package:e_cm/data/network/services/urls.dart';
import '../../model/order/order.dart';
import '../../model/product/product_order.dart';

class CartServices {
  Future<Order> addProductToOrder(
    String userId,
    List<ProductOrder> products,
    int amount,
    String address,
  ) async {
    final resp = await Dio().post('${URLS.urlApi}/orders',
        data: Map.from({
          'userId': userId,
          'products': products,
          'amount': amount,
          'address': address
        }));

    return Order.fromJson(resp.data);
  }
}

final cartServices = CartServices();
