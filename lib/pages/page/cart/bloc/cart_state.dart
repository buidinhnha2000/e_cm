part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class LoadingCartState extends CartState {}

class SuccessCartState extends CartState {
  final Order orders;

  SuccessCartState(this.orders);
}

class FailureCartState extends CartState {
  final String error;

  FailureCartState(this.error);
}

