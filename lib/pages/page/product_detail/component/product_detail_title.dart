import 'package:e_cm/data/models/product/product.dart';
import 'package:e_cm/data/network/remote.dart';
import 'package:flutter/material.dart';

class ProductDetailTitle extends StatelessWidget {
  const ProductDetailTitle({Key? key, required this.products}) : super(key: key);
  final Product products;
  @override
  Widget build(BuildContext context) {
    final product = GetDataSource();
    return FutureBuilder(
        future: product.getProduct(),
        builder: (context, snapshot) {
          return ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.only(left: 10, top: 10, bottom: 0),
            children: [
              Text(
                products.title,
                style: const TextStyle(color: Colors.white70, fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "${products.price} USD",
                style: const TextStyle(color: Colors.red, fontSize: 20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Text(
                        "Sold: ",
                        style: TextStyle(color: Colors.white70, fontSize: 17),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Text(
                        "${products.sold}",
                        style: const TextStyle(color: Colors.red, fontSize: 17),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Amount: ",
                        style: TextStyle(color: Colors.white70, fontSize: 17),
                      ),
                      Text(
                        "${products.amount}",
                        style: const TextStyle(color: Colors.red, fontSize: 17),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite_border_outlined,
                          size: 30,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.share, size: 30),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.message_outlined,
                              color: Colors.lightBlue, size: 30))
                    ],
                  )
                ],
              )
            ],
          );
        });
  }
}
