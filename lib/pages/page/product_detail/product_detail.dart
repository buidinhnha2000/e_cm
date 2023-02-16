import 'package:e_cm/app/navigator/router.dart';
import 'package:e_cm/l10n/l10n.dart';
import 'package:e_cm/pages/page/product_detail/bloc/product_bloc.dart';
import 'package:e_cm/pages/page/product_detail/component/product_detai_recommender.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/model/product/product.dart';
import '../../showdialog/model_success.dart';
import 'component/product_detail_avatar.dart';
import 'component/product_detail_bottom.dart';
import 'component/product_detail_header.dart';
import 'component/product_detail_product_review.dart';
import 'component/product_detail_title.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key, required this.products}) : super(key: key);

  final Product products;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductBloc, ProductState>(
      listener: (context, state) {
        if (state is LoadingProductState) {}
        if (state is FailureProductState) {}
        if (state is SuccessProductState) {}
        if (state is SuccessRatingState) {
          modalSuccess(context, 'Success', onPressed: () {
            setState(() {
              Navigator.pop(context);
            });
          });
        }
        if (state is SetAddProductToCartState) {
          modalSuccess(context, 'Add Success', onPressed: () {
            Navigator.of(context).pop();
          });
        }
        if (state is SetPurchaseProductToCartState) {
          Navigator.of(context).pushNamed(AppRoutes.cart);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          actions: const [
            ProductDetailHeader(),
          ],
          title: Text(
            context.l10n!.text_product,
            style: const TextStyle(color: Colors.white, fontSize: 23),
          ),
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          padding: const EdgeInsets.all(0.0),
          children: [
            ProductDetailAvatar(
              products: widget.products,
            ),
            ProductDetailTitle(
              products: widget.products,
            ),
            const SizedBox(
              height: 2,
            ),
            ProductReviewProductDetail(
              products: widget.products,
            ),
            const SizedBox(
              height: 2,
            ),
            const ProductDetailRecommendation(),
          ],
        ),
        bottomNavigationBar: ProductDetailBottom(product: widget.products),
      ),
    );
  }
}
