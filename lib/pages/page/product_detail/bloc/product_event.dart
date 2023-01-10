part of 'product_bloc.dart';

@immutable
abstract class ProductEvent {}

class OnAddProductToCartEvent extends ProductEvent {
  final CartProduct cart;

  OnAddProductToCartEvent(this.cart);
}
class OnPurchaseProductToCartEvent extends ProductEvent {
  final CartProduct cart;

  OnPurchaseProductToCartEvent(this.cart);
}

class OnDeleteProductToCartEvent extends ProductEvent {
  final Cart cart;

  OnDeleteProductToCartEvent(this.cart);

}

class IncrementQuantityProductEvent extends ProductEvent {
  final CartProduct cart;

  IncrementQuantityProductEvent(this.cart);
}

class DecrementQuantityProductEvent extends ProductEvent {
  final CartProduct cart;

  DecrementQuantityProductEvent(this.cart);

}

class OnRatingEvent extends ProductEvent{
  final String userId;
  final String productId;
  final String response;
  final int rating;

  OnRatingEvent(this.userId, this.productId, this.response, this.rating,);
}



