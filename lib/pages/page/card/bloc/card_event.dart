part of 'card_bloc.dart';

@immutable
abstract class CardEvent {}

class CardAddEvent extends CardEvent {
  final String email;
  final int numberCard;
  final String dateExpiry;
  final int cvc;
  final String nameCard;
  final String city;
  final int zip;

  CardAddEvent(this.email, this.numberCard, this.dateExpiry, this.cvc, this.nameCard, this.city, this.zip);
}
