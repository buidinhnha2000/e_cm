part of 'product_bloc.dart';

@immutable
abstract class ProductState {
  final List<Cart>? carts;
  final double total;
  final int amount;
  final double delivery;
  final double insurance;
  final String? pathImage;

  const ProductState({
    this.carts,
    this.total  = 00.0,
    this.amount = 0,
    this.delivery  = 15.0,
    this.insurance = 10.0,
    this.pathImage
  });
}

class ProductInitial extends ProductState {
  ProductInitial(): super(carts: [], total: 00.0, amount: 0);
}

class LoadingProductState extends ProductState {}

class SuccessProductState extends ProductState {}

class FailureProductState extends ProductState {
  final String error;

  const FailureProductState(this.error);
}

class SetAddProductToCartState extends ProductState{
  final List<Cart> carts;
  final double total;
  final int amount;

  const SetAddProductToCartState({
    required this.carts,
    required this.total,
    required this.amount
  }):super(carts: carts, total: total, amount: amount);
}

class SetImageForProductState extends ProductState {
  final String path;

  const SetImageForProductState(this.path):super(pathImage: path);
}
