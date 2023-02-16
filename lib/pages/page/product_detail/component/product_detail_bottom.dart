import 'package:e_cm/pages/page/product_detail/bloc/product_bloc.dart';
import 'package:e_cm/pages/showdialog/model_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../app/navigator/router.dart';
import '../../../../data/model/cart/cart.dart';
import '../../../../data/model/product/product.dart';
import '../../../../data/network/helper/secure_storage.dart';

class ProductDetailBottom extends StatefulWidget {
  const ProductDetailBottom({Key? key, required this.product})
      : super(key: key);
  final Product product;

  @override
  State<ProductDetailBottom> createState() => _ProductDetailBottomState();
}

class _ProductDetailBottomState extends State<ProductDetailBottom> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductBloc, ProductState>(
      listener: (context, state) {
        if (state is LoadingProductState) {

        } else if (state is FailureProductState) {

        } else if (state is SuccessProductState) {
          modalSuccess(context, 'Success', onPressed: (){});
          Navigator.of(context).pushNamed(AppRoutes.cart);
        }
      },
      child: BottomAppBar(
        height: 70,
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
              width: 170,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(width: 1, color: Colors.blueAccent),
                ),
                onPressed: () async {
                  final cart = CartProduct(
                    userId: await secureStorage.getUserId(),
                    productId: widget.product.productId,
                    quantity: 1,
                  );
                  context.read<ProductBloc>().add(OnAddProductToCartEvent(cart));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.shopping_cart_outlined,
                        color: Colors.blueAccent),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Add Cart",
                        style:
                            TextStyle(color: Colors.blueAccent, fontSize: 15))
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              height: 40,
              width: 170,
              child: OutlinedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.redAccent[400])),
                  onPressed: () async {
                    final cart = CartProduct(
                        userId: await secureStorage.getUserId(),
                        productId: widget.product.productId,
                        quantity: 1);
                    context
                        .read<ProductBloc>()
                        .add(OnPurchaseProductToCartEvent(cart));
                  },
                  child: const Center(
                    child: Text(
                      'Purchase',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
