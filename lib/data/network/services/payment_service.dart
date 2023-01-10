import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:e_cm/data/network/services/urls.dart';

class CardServices {

  Future<Map<String, dynamic>> callNoWebhookPayEndpointIntentId({
    required String paymentIntentId,
  }) async {
    final url = Uri.parse('${URLS.kApiUrl}/charge-card-off-session');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({'paymentIntentId': paymentIntentId}),
    );
    return json.decode(response.body);
  }

  Future<Map<String, dynamic>> callNoWebhookPayEndpointMethodId({
    required bool useStripeSdk,
    required String paymentMethodId,
    required String currency,
    List<String>? items, required int price,
  }) async {
    final url = Uri.parse('${URLS.kApiUrl}/pay-without-webhooks');

    final response = await http.post(
      url,
      headers: Map.of({
        'Accept': 'application/json',
        'Authorization':
        'Bearer sk_test_51MPiR5F3jTOIqx0T6RVAUoMEUiPuUO2P3pgQeItcXP3iSMBrYzaoiIQO1oBZnmaW6xTPh16X63WAaTAtbaS11WEL00sjKLNwpC',
        'Content-Type': 'application/json',
      }),
      body: json.encode({
        'useStripeSdk': useStripeSdk,
        'paymentMethodId': paymentMethodId,
        'currency': currency,
        'items': items
      }),
    );
    return json.decode(response.body);
  }

// Future<Payment?> payment(String paymentId, double cardPrice) async {
//   try {
//     final resp = await Dio().put('${URLS.urlApi}/payments',
//         data: Map.from({'paymentId': paymentId, 'cardPrice': cardPrice}));
//     final payment = Payment.fromJson(resp.data);
//     print(payment);
//     return Payment.fromJson(resp.data);
//   } on Exception catch (e) {
//     log(e.toString());
//     return null;
//   }
// }

}
final cardServices = CardServices();
