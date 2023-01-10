part of 'card_bloc.dart';

@immutable
abstract class CardState {

}

class CardInitial extends CardState {

}

class LoadingCard extends CardState {

}

class SuccessCard extends CardState {
  final CardDetails card;

  SuccessCard(this.card);

}

class FailedCard extends CardState {
  final error;

  FailedCard(this.error);

}
