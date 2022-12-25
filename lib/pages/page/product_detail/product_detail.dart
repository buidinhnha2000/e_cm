import 'package:e_cm/data/models/movie/movie.dart';
import 'package:e_cm/data/models/product/product.dart';
import 'package:e_cm/l10n/l10n.dart';
import 'package:e_cm/pages/screen/home/component/home_product.dart';
import 'package:flutter/material.dart';
import 'component/product_detail_avatar.dart';
import 'component/product_detail_bottom.dart';
import 'component/product_detail_header.dart';
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: const [
          ProductDetailHeader(),
        ],
        title: Text(context.l10n!.text_product, style: const TextStyle(color: Colors.white, fontSize: 23),),

      ),
      body: Stack(
        children: [
          ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            padding: const EdgeInsets.all(0.0),
            children: [
              ProductDetailAvatar(products: widget.products,),
              ProductDetailTitle(products: widget.products,),
              const SizedBox(height: 5,),
              // const SizedBox(height: 5,),
              // const ProductOtherProductDetail(),
              // const SizedBox(height: 5,),
              // const PropertiesProductDetail(),
              // SizedBox(height: 5,),
              // const ProductReviewProductDetail(),
              // SizedBox(height: 5,),
              const HomeProduct(),
              // SizedBox(height: 40,)
            ],
          ),
        ],
      ),
      bottomNavigationBar: const ProductDetailBottom(),
    );
  }
}