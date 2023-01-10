import 'package:e_cm/l10n/l10n.dart';
import 'package:e_cm/pages/page/cart/bloc/cart_bloc.dart';
import 'package:e_cm/pages/page/cart/component/cart_bottom.dart';
import 'package:e_cm/pages/showdialog/model_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../app/navigator/router.dart';
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
    return BlocListener<CartBloc, CartState>(
      listener: (context, state) {
        if (state is LoadingCartState) {

        } else if (state is FailureCartState) {
          modalSuccess(context, 'Success', onPressed: (){Navigator.of(context).pushNamed(
            AppRoutes.screen,
          );});
        } else if (state is SuccessCartState) {
          modalSuccess(context, 'Success', onPressed: (){Navigator.of(context).pushNamed(
            AppRoutes.screen,
          );});
        }
      },
      child: Scaffold(
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
                CartProducts(),
              ],
            ),
          ],
        ),
        bottomNavigationBar: const CartBottom(),
      ),
    );
  }
}
