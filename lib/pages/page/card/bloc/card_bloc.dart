import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import '../../../../common/base_state.dart';
import '../../../../data/model/card/billing.dart';
import '../../../../data/network/services/payment_service.dart';
part 'card_state.dart';
part 'card_event.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  CardBloc() : super(CardInitial()) {
    on<PaymentCreateIntent>(_onPaymentCreateIntent);
  }

  Future<void> _onPaymentCreateIntent(
      PaymentCreateIntent event, Emitter<CardState> emit) async {
    CardDetails card = event.card;

    try {
      await Stripe.instance.dangerouslyUpdateCardDetails(card);

      final paymentMethod = await Stripe.instance.createPaymentMethod(
          params: PaymentMethodParams.card(
              paymentMethodData:
              PaymentMethodData(billingDetails: event.billingDetails)));
      final paymentIntentResult = await cardServices
          .callNoWebhookPayEndpointMethodId(
          useStripeSdk: true,
          paymentMethodId: paymentMethod.id,
          currency: 'usd',
          items: ['id-1'], price: 200);
      if (paymentIntentResult['error'] != null) {
        // Error during creating or confirming Intent
        print('Error1: ${paymentIntentResult['error']}');
        return;
      }
      if (paymentIntentResult['clientSecret'] != null &&
          paymentIntentResult['requiresAction'] == null) {
        print('Success!: The payment was confirmed successfully!');
        return;
      }
      if (paymentIntentResult['clientSecret'] != null &&
          paymentIntentResult['requiresAction'] == true) {
        // 4. if payment requires action calling handleNextAction
        final paymentIntent = await Stripe.instance
            .handleNextAction(paymentIntentResult['clientSecret']);

        if (paymentIntent.status == PaymentIntentsStatus.RequiresConfirmation) {
          // 5. Call API to confirm intent
          await confirmIntent(paymentIntent.id);
        } else {
          print('Error2: ${paymentIntentResult['error']}');
        }
      }
    } catch (e) {
      rethrow;
    }
    BillingDetailModel billingDetailModel = const BillingDetailModel();
    emit(PaymentCreateIntentState(billingDetailModel));
  }

  Future<void> confirmIntent(String paymentIntentId) async {
    final result = await cardServices.callNoWebhookPayEndpointIntentId(
        paymentIntentId: paymentIntentId);
    if (result['error'] != null) {
      print('error');
    } else {
      print('success');
    }
  }
}
