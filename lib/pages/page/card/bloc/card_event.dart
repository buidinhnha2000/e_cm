part of 'card_bloc.dart';

@immutable
abstract class CardEvent extends BaseState{}

class PaymentCreateMethod extends CardEvent {
  final CardDetails card;

  PaymentCreateMethod(this.card);

  @override
  List<Object?> get props => [card];
}

class PaymentCreateIntent extends CardEvent {
  final BillingDetails billingDetails;
  final CardDetails card;

  PaymentCreateIntent({required this.billingDetails, required this.card});

  @override
  List<Object?> get props => [billingDetails, card];

}

