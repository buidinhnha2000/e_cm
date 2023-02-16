import 'package:e_cm/app/navigator/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../../data/model/product/product.dart';
import '../../../screen/home/component/home_product.dart';

class ProductDetailTitle extends StatefulWidget {
  const ProductDetailTitle({Key? key, required this.products})
      : super(key: key);
  final Product products;

  @override
  State<ProductDetailTitle> createState() => _ProductDetailTitleState();
}

class _ProductDetailTitleState extends State<ProductDetailTitle> {

  late String firstHalf;
  late String secondHalf;
  bool flag = true;

  @override
  void initState() {
    super.initState();
    if (widget.products.desc.length > 200) {
      firstHalf = widget.products.desc.substring(0, 200);
      secondHalf =
          widget.products.desc.substring(200, widget.products.desc.length);
    } else {
      firstHalf = widget.products.desc;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black45,
      child: FutureBuilder(
          future: product.getProduct(),
          builder: (context, snapshot) {
            return ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 10),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.products.title,
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    RatingBarIndicator(
                      rating: widget.products.rating!.toDouble(),
                      itemBuilder: (context, index) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 25.0,
                      direction: Axis.horizontal,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "${widget.products.price} \$",
                  style: TextStyle(
                      color: Colors.redAccent[400],
                      fontSize: 24,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Text(
                      "Sold ",
                      style: TextStyle(color: Colors.white70, fontSize: 15),
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Text(
                      "${widget.products.sold}",
                      style: const TextStyle(color: Colors.red, fontSize: 15),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Quantity ",
                      style: TextStyle(color: Colors.white70, fontSize: 15),
                    ),
                    Text(
                      "${widget.products.quantity}",
                      style: const TextStyle(color: Colors.red, fontSize: 15),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.from((widget.products.categories
                                .toList())
                            .map((size) => Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: SizedBox(
                                    height: 30,
                                    child: OutlinedButton(
                                        onPressed: () {
                                          Navigator.of(context)
                                              .pushNamed(AppRoutes.categories);
                                        },
                                        child: Text(size)),
                                  ),
                                )))),
                    Row(
                      children: [
                        FutureBuilder(
                            future: product.getProduct(),
                            builder: (context, index) {
                              if (widget.products.like == 0) {
                                return IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.favorite_border_outlined,
                                    size: 30,
                                  ),
                                );
                              } else {
                                return IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                    size: 30,
                                  ),
                                );
                              }
                            }),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.share, size: 30),
                        ),
                      ],
                    )
                  ],
                ),
                Container(
                  child:
                      secondHalf.isEmpty ? Text(firstHalf) : Column(
                        children: [
                          Text(flag ? ("$firstHalf . . .") : (firstHalf + secondHalf)),
                          GestureDetector(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(flag ? "Show more" : "Show less", style:  const TextStyle(color: Colors.blueAccent),),
                              ],
                            ),
                            onTap: () {
                              setState(() {
                                flag = !flag;
                              });
                            },
                          )
                        ],
                      ),
                )
              ],
            );
          }),
    );
  }
}
