import 'package:bloc/bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:meta/meta.dart';


part 'card_event.dart';
part 'card_state.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  CardBloc() : super(CardInitial()) {
    on<CardAddEvent>(_addCard);
  }

  Future<void> _addCard(CardAddEvent event, Emitter<CardState> emit) async {
    try {
      emit(LoadingCard());

    }
    catch(e) {
      print(e);
      emit(FailedCard(e.toString()));
    }
  }
}
