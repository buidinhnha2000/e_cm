import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_cm/data/network/remote.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../../app/navigator/router.dart';
import '../../../../data/model/product/product.dart';

final product = GetDataSource();

class HomeSale extends StatefulWidget {
  const HomeSale({Key? key}) : super(key: key);

  @override
  State<HomeSale> createState() => _HomeSaleState();
}

class _HomeSaleState extends State<HomeSale> {

  routeDetail(Product product) {
    Navigator.of(context)
        .pushNamed(AppRoutes.productDetail, arguments: product);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.pink[50]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                    left: 15,
                  ),
                  child: Text(
                    "Recommended products",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                TextButton(
                    onPressed: () {},
                    child: Row(
                      children: const [
                        Text(
                          "More",
                          style: TextStyle(color: Colors.red, fontSize: 16),
                        ),
                        Icon(
                          Icons.navigate_next_rounded,
                          color: Colors.red,
                        )
                      ],
                    )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.blueGrey[900]),
                  height: 190,
                  width: MediaQuery.of(context).size.width,
                  child: FutureBuilder<List<Product>>(
                    future: product.getProductRecommenderId(),
                    builder: (BuildContext context, snapshot) {
                      if(snapshot.hasData && snapshot.data != null) {
                        return ListView.builder(
                          shrinkWrap: false,
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data?.length ?? 0,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                routeDetail(snapshot.data![index]);
                              },
                              child: Container(
                                padding: const EdgeInsets.only(
                                  left: 10,
                                  top: 10,
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                        height: 150,
                                        width: 130,
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(5)),
                                          child: CachedNetworkImage(
                                            imageUrl: snapshot.data![index].img,
                                            fit: BoxFit.fill,
                                          ),
                                        )),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    // Text(
                                    //   "${snapshot.data![index].rating} \$",
                                    //   style: const TextStyle(color: Colors.pink),
                                    // ),
                                    RatingBarIndicator(
                                      rating: snapshot.data![index].rating!.toDouble(),
                                      itemBuilder: (context, index) => const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      itemCount: 5,
                                      itemSize: 20.0,
                                      direction: Axis.horizontal,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      } return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.redAccent,
                        ),
                      );
                    },
                  )),
            ),
          ],
        )
    );
  }
}
