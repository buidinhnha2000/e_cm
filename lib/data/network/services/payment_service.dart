import 'dart:convert';
import 'package:e_cm/data/network/services/urls.dart';
import 'package:http/http.dart' as http;

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
    List<String>? items,
    required double? price,
  }) async {
    final url = Uri.parse('${URLS.kApiUrl}/pay-without-webhooks');
    final data = json.encode({
      'useStripeSdk': useStripeSdk,
      'paymentMethodId': paymentMethodId,
      'currency': currency,
      'items': items,
      'price' : 226000.0,
    });
    final response = await http.post(
      url,
      headers: Map.of({
        'Accept': 'application/json',
        'Authorization':
        'Bearer sk_test_51MPiR5F3jTOIqx0T6RVAUoMEUiPuUO2P3pgQeItcXP3iSMBrYzaoiIQO1oBZnmaW6xTPh16X63WAaTAtbaS11WEL00sjKLNwpC',
        'Content-Type': 'application/json',
      }),
      body: data,
    );
    return json.decode(response.body);
  }
}

final cardServices = CardServices();
