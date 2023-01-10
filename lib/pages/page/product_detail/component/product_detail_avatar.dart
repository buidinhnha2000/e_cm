import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_cm/data/models/movie/movie.dart';
import 'package:e_cm/data/models/product/product.dart';
import 'package:e_cm/data/network/remote.dart';
import 'package:flutter/material.dart';

import '../../../../data/model/product/product.dart';

class ProductDetailAvatar extends StatelessWidget {
  const ProductDetailAvatar({Key? key, required this.products}) : super(key: key);
  final Product products;

  @override
  Widget build(BuildContext context) {
    final product = GetDataSource();
    return FutureBuilder(
        future: product.getProduct(),
        builder: (context, snapshot) {
          if(snapshot.hasData && snapshot.data != null) {
            return SizedBox(
              height: 300,
              child: CachedNetworkImage(
                imageUrl: products.img,
                fit: BoxFit.fill,
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.redAccent,
            ),
          );
    });
  }
}
