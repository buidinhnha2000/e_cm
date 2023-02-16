part of 'card_bloc.dart';

@immutable
abstract class CardState extends BaseState {
}

class CardInitial extends CardState {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class PaymentCreateIntentState extends CardState {
  final BillingDetailModel billingDetailModel;

  PaymentCreateIntentState(this.billingDetailModel);

  @override
  List<Object?> get props => [billingDetailModel];
}
class PaymentCreateMethodState extends CardState{
  final CardDetails card;

  PaymentCreateMethodState(this.card);

  @override
  List<Object?> get props => [card];
}
