part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class AddToOrder extends CartEvent {
  AddToOrder();
}

class DeleteFromCart extends CartEvent {}

class DeleteProductToCart extends CartEvent {
  final Cart cart;

  DeleteProductToCart(this.cart);
}

