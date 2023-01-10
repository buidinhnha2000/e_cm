import 'package:e_cm/data/network/remote.dart';
import 'package:e_cm/data/network/services/product.services.dart';
import 'package:e_cm/data/network/services/rating_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/model/cart/cart.dart';
import '../../../../data/model/rating/rating.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {

  List<Cart> carts = [];

  ProductBloc() : super(ProductInitial()) {
    on<OnAddProductToCartEvent>(_addProductToCart);
    on<OnPurchaseProductToCartEvent>(_purchaseProductToCart);
    on<OnDeleteProductToCartEvent>(_deleteProductToCart);
    on<IncrementQuantityProductEvent>(_incrementQuantityProduct);
    on<DecrementQuantityProductEvent>(_decrementQuantityProduct);
    on<OnRatingEvent>(_ratingToRating);
  }

  Future<void> _addProductToCart( OnAddProductToCartEvent event, Emitter<ProductState> emit ) async {
    final cart = await productServices.addProductToCart(event.cart.userId, event.cart.productId);
    emit(SetAddProductToCartState(carts: carts, amount: cart.quantity!.toInt()));
  }

  Future<void> _purchaseProductToCart( OnPurchaseProductToCartEvent event, Emitter<ProductState> emit ) async {
    final cart = await productServices.addProductToCart(event.cart.userId, event.cart.productId);
    emit(SetPurchaseProductToCartState(carts: carts, amount: cart.quantity!.toInt()));
  }

  Future<void> _deleteProductToCart (OnDeleteProductToCartEvent event, Emitter<ProductState> emit) async {
    final cart = await productServices.deleteProductToCart(event.cart.userId, event.cart.product!.productId);
    emit(SetDeleteProductToCartState(carts: carts, amount: cart.quantity!.toInt()));
  }

  Future<void> _incrementQuantityProduct( IncrementQuantityProductEvent event, Emitter<ProductState> emit ) async {

    final datasource = GetDataSource();
    final _cart = datasource.getCart();
    final cart = await productServices.updateProductToCart(event.cart.userId, event.cart.productId);
    emit(SetIncrementProductState(carts: carts, amount: cart.quantity!.toInt()));
  }

  Future<void> _decrementQuantityProduct( DecrementQuantityProductEvent event, Emitter<ProductState> emit ) async {

    emit( SetAddProductToCartState(carts: carts, amount: carts.length));
  }

  Future<void> _ratingToRating(OnRatingEvent event, Emitter<ProductState> emit) async {
    try {
      LoadingProductState();
      final rating = await ratingServices.ratingToRating(event.userId, event.productId, event.response, event.rating);
      emit(SuccessRatingState(rating));

    }catch(e) {
      emit(FailureProductState(e.toString()));
    }
  }
}
