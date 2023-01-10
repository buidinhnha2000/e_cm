
import 'package:flutter/material.dart';
import '../../../../app/navigator/router.dart';
import '../../../widget/icon_funtion.dart';

class ProductDetailHeader extends StatefulWidget {
  const ProductDetailHeader({super.key});

  @override
  State<ProductDetailHeader> createState() => _ProductDetailHeaderState();
}

class _ProductDetailHeaderState extends State<ProductDetailHeader> {
  @override
  Widget build(BuildContext context) {
    routeCart() {
      Navigator.of(context)
          .pushNamed(AppRoutes.cart);
    }
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(right: 10),
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconFuntion(
              color: Colors.white,
              icon: Icons.shopping_cart_outlined,
              onPress: () {
                routeCart();
              },
              notification: 4,
            ),
            IconFuntion(
              color: Colors.white,
              icon: Icons.chat,
              onPress: () {},
              notification: 1,
            )
          ],
        ),
      ),
    );
  }
}
