import 'dart:async';
import 'package:e_cm/data/network/helper/secure_storage.dart';
import 'package:e_cm/data/network/services/cart_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/model/cart/cart.dart';
import '../../../../data/model/order/order.dart';
import '../../../../data/model/product/product_order.dart';
import '../../../../data/network/remote.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<AddToOrder>(_onAddToOrder);
  }

  Future<void> _onAddToOrder(AddToOrder event, Emitter<CartState> emit) async {
    try {
      emit(LoadingCartState());
      final datasource = GetDataSource();
      final carts = await datasource.getCart();
      final userId = await secureStorage.getUserId();
      final country = await secureStorage.getCountry();
      var amount = 0;
      double totalCard = 0;
      final total = carts.map((cart) {
        totalCard += cart.product!.price * cart.quantity!;
        return totalCard;
      });
      print(total);

      final products = carts.map((cart) {
        amount += cart.quantity!;
        return ProductOrder (
            productId: cart.product!.productId, quantity: cart.quantity!.toInt());
      })
          .toList();
      if (userId != null) {
        final order = await cartServices.addProductToOrder(
            userId, products, amount, country!);

        emit(SuccessCartState(order));
      }else{
        emit(FailureCartState('user'));
      }
    } catch (e) {
      emit(FailureCartState(e.toString()));
    }
  }
}
