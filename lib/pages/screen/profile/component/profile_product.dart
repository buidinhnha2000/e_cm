import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_cm/pages/page/categories/categories.dart';
import 'package:flutter/material.dart';
import '../../../../data/model/product/product.dart';

class ProfileProduct extends StatelessWidget {
  const ProfileProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black45,
      child:Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.all(0),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Icon(
                      Icons.queue,
                      color: Colors.pink,
                      size: 25,
                    ),
                    SizedBox(width: 10,),
                    Text("Purchased product", style: TextStyle(fontSize: 15, color: Colors.white70),)
                  ],
                ),
                Row(
                  children: const [
                    Text("More", style: TextStyle(fontSize: 13, color: Colors.white38),),
                    Icon(Icons.navigate_next, color: Colors.white30,)
                  ],
                )
              ],
            ),
            const SizedBox(height: 5,),
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                height: 220,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                child: FutureBuilder<List<Product>>(
                  future: product.getProduct(),
                  builder: (context, snapshot) {
                    if(snapshot.hasData && snapshot.data !=null){
                      return ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data?.length ?? 0,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            child: Container(
                              width: 125,
                              padding: const EdgeInsets.only(
                                  left: 10, top: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                                    child: CachedNetworkImage(
                                      imageUrl: snapshot.data![index].img,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  SizedBox(
                                    height: 40,
                                    child: Text(
                                      snapshot.data![index].title,
                                      style:
                                      const TextStyle(color: Colors.white60),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "${snapshot.data![index].price} \$",
                                    style: const TextStyle(color: Colors.red),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        "Da ban",
                                        style: TextStyle(color: Colors.white60),
                                      ),
                                      const SizedBox(
                                        width: 3,
                                      ),
                                      Text(
                                        "${snapshot.data![index].quantity}",
                                        style: const TextStyle(
                                            color: Colors.white60),
                                      )
                                    ],
                                  )
                                ],
                              ),
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
                  },
                )),
          ],
        ),
      ),
    );
  }
}
