part of 'product_bloc.dart';

@immutable
abstract class ProductState {
  final List<Cart>? carts;
  final int amount;
  final double delivery;
  final double insurance;
  final String? pathImage;

  const ProductState({
    this.carts,
    this.amount = 0,
    this.delivery  = 15.0,
    this.insurance = 10.0,
    this.pathImage
  });
}

class ProductInitial extends ProductState {
  ProductInitial(): super(carts: [], amount: 0);
}

class LoadingProductState extends ProductState {}

class SuccessProductState extends ProductState {

}

class SuccessRatingState extends ProductState {
  final Rating rating;

  const SuccessRatingState(this.rating);
}


class FailureProductState extends ProductState {
  final String error;

  const FailureProductState(this.error);
}

class SetAddProductToCartState extends ProductState{
  final List<Cart> carts;
  final int amount;

  const SetAddProductToCartState({
    required this.carts,
    required this.amount
  }):super(carts: carts, amount: amount);
}

class SetPurchaseProductToCartState extends ProductState{
  final List<Cart> carts;
  final int amount;

  const SetPurchaseProductToCartState({
    required this.carts,
    required this.amount
  }):super(carts: carts, amount: amount);
}

class SetDeleteProductToCartState extends ProductState{
  final List<Cart> carts;
  final int amount;

  const SetDeleteProductToCartState({
    required this.carts,
    required this.amount
  }):super(carts: carts, amount: amount);
}

class SetIncrementProductState extends ProductState{
  final List<Cart> carts;
  final int amount;

  const SetIncrementProductState({
    required this.carts,
    required this.amount
  }):super(carts: carts, amount: amount);
}

class SetDecrementProductState extends ProductState{
  final List<Cart> carts;
  final int amount;

  const SetDecrementProductState({
    required this.carts,
    required this.amount
  }):super(carts: carts, amount: amount);
}

class RatingState extends ProductState{
  final List<Rating> ratings;

  const RatingState(this.ratings);
}

