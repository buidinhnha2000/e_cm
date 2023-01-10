import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_cm/app/navigator/router.dart';
import 'package:e_cm/data/network/remote.dart';
import 'package:flutter/material.dart';

import '../../../../data/model/product/product.dart';

final product = GetDataSource();

class HomeProduct extends StatelessWidget {
  const HomeProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    routeDetail(Product product) {
      Navigator.of(context)
          .pushNamed(AppRoutes.productDetail, arguments: product);
    }

    return Container(
        color: Colors.black45,
        padding: const EdgeInsets.all(10),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(0),
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 0, bottom: 10),
              child: Text(
                "Featured products",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ),
            FutureBuilder<List<Product>>(
                future: product.getProduct(),
                builder: (BuildContext context, snapshot) {
                  // debugPrint(snapshot.data.toString());
                  if (snapshot.hasData && snapshot.data != null) {
                    return GridView.builder(
                      padding: const EdgeInsets.all(0),
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                      const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          mainAxisExtent: 250,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (BuildContext context, index) {
                        final data = snapshot.data![index].categories.toList();
                        return GestureDetector(
                          onTap: () {
                            routeDetail(snapshot.data![index]);
                          },
                          child: Stack(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 200,
                                    width: size.width,
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5)),
                                      child: CachedNetworkImage(
                                        imageUrl: snapshot.data![index].img,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    snapshot.data![index].title,
                                    style: const TextStyle(color: Colors.red),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "${snapshot.data![index].price} \$",
                                        style: const TextStyle(
                                            color: Colors.blueAccent),
                                      ),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: List.from(data.map((cate) => Padding(
                                          padding: const EdgeInsets.only(right: 5),
                                          child: Text(cate),
                                        ))),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.redAccent,
                    ),
                  );
                }),
            Container(
              height: 40,
            )
          ],
        ));
  }
}
