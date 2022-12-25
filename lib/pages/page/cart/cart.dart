import 'package:e_cm/l10n/l10n.dart';
import 'package:e_cm/pages/page/cart/component/cart_bottom.dart';
import 'package:flutter/material.dart';
import '../product_detail/component/product_detail_header.dart';
import 'component/cart_product.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: const [
          ProductDetailHeader(),
        ],
        title: Text(
          context.l10n!.text_cart,
          style: const TextStyle(color: Colors.white, fontSize: 23),
        ),
      ),
      body: Stack(
        children: [
          ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            padding: const EdgeInsets.all(0.0),
            children: const [
              CartProduct(),
            ],
          ),
        ],
      ),
      bottomNavigationBar: const CartBottom(),
    );
  }
}
