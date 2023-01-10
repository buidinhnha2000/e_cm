import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Stripe.publishableKey = 'pk_test_51MPiR5F3jTOIqx0TGmdsF3Pttxnirlr6zhW1tSR7bOb4nM3reMihpJ72YQBfVetgBnpBemrLa3z2BxA7oiLiIbXr00899kHQZ5';
  Stripe.merchantIdentifier = 'merchant.flutter.stripe.test';
  Stripe.urlScheme = 'flutterstripe';
  await Stripe.instance.applySettings();

  runApp(const App());
}
