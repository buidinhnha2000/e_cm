import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/models/cart/cart.dart';
import '../../../../data/models/product/product.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {

  List<Cart> carts = [];

  ProductBloc() : super(ProductInitial()) {
    on<OnAddProductToCartEvent>(_addProductToCart);
    on<OnPlusQuantityProductEvent>(_plusQuantityProduct);
    on<OnSubtractQuantityProductEvent>(_subtractQuantityProduct);
  }

  Future<void> _addProductToCart( OnAddProductToCartEvent event, Emitter<ProductState> emit ) async {

    final hasCart = carts.contains( event.carts );

    if( !hasCart ){

      carts.add( event.carts );

      double sum = 0;

      carts.forEach((e) => sum = sum + e.product.price );

      emit( SetAddProductToCartState(carts: carts, total: sum, amount: carts.length ));

    }
  }
  Future<void> _plusQuantityProduct( OnPlusQuantityProductEvent event, Emitter<ProductState> emit ) async {

    carts[event.plus].product.amount + 1;

    double total = 0;
    carts.forEach((e) => total = total + (e.product.price * e.product.amount));

    emit( SetAddProductToCartState(carts: carts, total: total, amount: carts.length));
  }

  Future<void> _subtractQuantityProduct( OnSubtractQuantityProductEvent event, Emitter<ProductState> emit ) async {

    carts[event.subtract].product.amount -1;

    double total = 0;
    carts.forEach((e) => total = total - (e.product.price * e.product.amount));

    emit( SetAddProductToCartState(carts: carts, total: total.abs(), amount: carts.length));
  }

}
