import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_cm/app/navigator/router.dart';
import 'package:e_cm/data/network/remote.dart';
import 'package:e_cm/l10n/l10n.dart';
import 'package:flutter/material.dart';
import '../../../data/model/product/product.dart';
import '../product_detail/component/product_detail_header.dart';

final category = GetDataSource();
final product = GetDataSource();

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 6, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    routeDetail(Product product) {
      Navigator.of(context)
          .pushNamed(AppRoutes.productDetail, arguments: product);
    }

    return FutureBuilder(
        future: category.getCategories(),
        builder: (BuildContext context, snapshot) {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.black,
                actions: const [
                  ProductDetailHeader(),
                ],
                title: Text(
                  context.l10n!.text_categories,
                  style: const TextStyle(color: Colors.white, fontSize: 23),
                ),
              ),
              body: Column(children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(bottom: 10),
                  color: Colors.black,
                  child: TabBar(
                    controller: _tabController,
                    labelColor: Colors.red,
                    isScrollable: true,
                    indicatorColor: Colors.transparent,
                    unselectedLabelColor: Colors.grey,
                    unselectedLabelStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                      fontWeight: FontWeight.w700,
                    ),
                    labelStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                    tabs: const <Widget>[
                      Text('All'),
                      Text('Shoes'),
                      Text('Books'),
                      Text('Fashion'),
                      Text('Accessory'),
                      Text('Phone'),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: FutureBuilder<List<Product>>(
                            future: product.getProduct(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData && snapshot.data != null) {
                                return GridView.builder(
                                  padding: const EdgeInsets.all(0),
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
                                    final data = snapshot
                                        .data![index].categories
                                        .toList();
                                    return GestureDetector(
                                      onTap: () {
                                        routeDetail(snapshot.data![index]);
                                      },
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 200,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(5)),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    snapshot.data![index].img,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 2,
                                          ),
                                          Text(
                                            snapshot.data![index].title,
                                            style: const TextStyle(
                                                color: Colors.red),
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
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: List.from(
                                                    data.map((cate) => Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 5),
                                                          child: Text(cate),
                                                        ))),
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
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: GridView(
                          padding: const EdgeInsets.all(0),
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 200,
                                  mainAxisExtent: 250,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          children: [
                            Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 200,
                                  width: MediaQuery.of(context)
                                      .size
                                      .width,
                                  child: ClipRRect(
                                    borderRadius:
                                    const BorderRadius.all(
                                        Radius.circular(5)),
                                    child: CachedNetworkImage(
                                      imageUrl:
                                      'https://salt.tikicdn.com/cache/750x750/ts/product/9c/fd/38/6081f6c03dee5c8aa4c75aaf8d86bfd0.jpg.webp',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  'Urban TM2107 men\'s',
                                  style: TextStyle(
                                      color: Colors.red),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      "10000.0 \$",
                                      style: TextStyle(
                                          color: Colors.blueAccent),
                                    ),
                                    Text("Shoes")
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 200,
                                  width: MediaQuery.of(context)
                                      .size
                                      .width,
                                  child: ClipRRect(
                                    borderRadius:
                                    const BorderRadius.all(
                                        Radius.circular(5)),
                                    child: CachedNetworkImage(
                                      imageUrl: 'https://salt.tikicdn.com/cache/280x280/ts/product/c1/39/78/ff160d39fffed050376be9974d6da23d.png.webp',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  'New Balance Cushioning',
                                  style: TextStyle(
                                      color: Colors.red),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      "230000.0 \$",
                                      style: TextStyle(
                                          color: Colors.blueAccent),
                                    ),
                                    Text("Shoes")
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: GridView(
                          padding: const EdgeInsets.all(0),
                          gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              mainAxisExtent: 250,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          children: [
                            Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 200,
                                  width: MediaQuery.of(context)
                                      .size
                                      .width,
                                  child: ClipRRect(
                                    borderRadius:
                                    const BorderRadius.all(
                                        Radius.circular(5)),
                                    child: CachedNetworkImage(
                                      imageUrl:
                                      'https://salt.tikicdn.com/cache/750x750/ts/product/9c/fd/38/6081f6c03dee5c8aa4c75aaf8d86bfd0.jpg.webp',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  'Urban TM2107 men\'s',
                                  style: TextStyle(
                                      color: Colors.red),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      "10000.0 \$",
                                      style: TextStyle(
                                          color: Colors.blueAccent),
                                    ),
                                    Text("Shoes")
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 200,
                                  width: MediaQuery.of(context)
                                      .size
                                      .width,
                                  child: ClipRRect(
                                    borderRadius:
                                    const BorderRadius.all(
                                        Radius.circular(5)),
                                    child: CachedNetworkImage(
                                      imageUrl: 'https://salt.tikicdn.com/cache/280x280/ts/product/c1/39/78/ff160d39fffed050376be9974d6da23d.png.webp',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  'New Balance Cushioning',
                                  style: TextStyle(
                                      color: Colors.red),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      "230000.0 \$",
                                      style: TextStyle(
                                          color: Colors.blueAccent),
                                    ),
                                    Text("Shoes")
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: GridView(
                          padding: const EdgeInsets.all(0),
                          gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              mainAxisExtent: 250,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          children: [
                            Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 200,
                                  width: MediaQuery.of(context)
                                      .size
                                      .width,
                                  child: ClipRRect(
                                    borderRadius:
                                    const BorderRadius.all(
                                        Radius.circular(5)),
                                    child: CachedNetworkImage(
                                      imageUrl:
                                      'https://salt.tikicdn.com/cache/750x750/ts/product/9c/fd/38/6081f6c03dee5c8aa4c75aaf8d86bfd0.jpg.webp',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  'Urban TM2107 men\'s',
                                  style: TextStyle(
                                      color: Colors.red),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      "10000.0 \$",
                                      style: TextStyle(
                                          color: Colors.blueAccent),
                                    ),
                                    Text("Shoes")
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 200,
                                  width: MediaQuery.of(context)
                                      .size
                                      .width,
                                  child: ClipRRect(
                                    borderRadius:
                                    const BorderRadius.all(
                                        Radius.circular(5)),
                                    child: CachedNetworkImage(
                                      imageUrl: 'https://salt.tikicdn.com/cache/280x280/ts/product/c1/39/78/ff160d39fffed050376be9974d6da23d.png.webp',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  'New Balance Cushioning',
                                  style: TextStyle(
                                      color: Colors.red),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      "230000.0 \$",
                                      style: TextStyle(
                                          color: Colors.blueAccent),
                                    ),
                                    Text("Shoes")
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: GridView(
                          padding: const EdgeInsets.all(0),
                          gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              mainAxisExtent: 250,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          children: [
                            Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 200,
                                  width: MediaQuery.of(context)
                                      .size
                                      .width,
                                  child: ClipRRect(
                                    borderRadius:
                                    const BorderRadius.all(
                                        Radius.circular(5)),
                                    child: CachedNetworkImage(
                                      imageUrl:
                                      'https://salt.tikicdn.com/cache/750x750/ts/product/9c/fd/38/6081f6c03dee5c8aa4c75aaf8d86bfd0.jpg.webp',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  'Urban TM2107 men\'s',
                                  style: TextStyle(
                                      color: Colors.red),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      "10000.0 \$",
                                      style: TextStyle(
                                          color: Colors.blueAccent),
                                    ),
                                    Text("Shoes")
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 200,
                                  width: MediaQuery.of(context)
                                      .size
                                      .width,
                                  child: ClipRRect(
                                    borderRadius:
                                    const BorderRadius.all(
                                        Radius.circular(5)),
                                    child: CachedNetworkImage(
                                      imageUrl: 'https://salt.tikicdn.com/cache/280x280/ts/product/c1/39/78/ff160d39fffed050376be9974d6da23d.png.webp',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  'New Balance Cushioning',
                                  style: TextStyle(
                                      color: Colors.red),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      "230000.0 \$",
                                      style: TextStyle(
                                          color: Colors.blueAccent),
                                    ),
                                    Text("Shoes")
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: GridView(
                          padding: const EdgeInsets.all(0),
                          gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              mainAxisExtent: 250,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          children: [
                            Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 200,
                                  width: MediaQuery.of(context)
                                      .size
                                      .width,
                                  child: ClipRRect(
                                    borderRadius:
                                    const BorderRadius.all(
                                        Radius.circular(5)),
                                    child: CachedNetworkImage(
                                      imageUrl:
                                      'https://salt.tikicdn.com/cache/750x750/ts/product/9c/fd/38/6081f6c03dee5c8aa4c75aaf8d86bfd0.jpg.webp',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  'Urban TM2107 men\'s',
                                  style: TextStyle(
                                      color: Colors.red),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      "10000.0 \$",
                                      style: TextStyle(
                                          color: Colors.blueAccent),
                                    ),
                                    Text("Shoes")
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 200,
                                  width: MediaQuery.of(context)
                                      .size
                                      .width,
                                  child: ClipRRect(
                                    borderRadius:
                                    const BorderRadius.all(
                                        Radius.circular(5)),
                                    child: CachedNetworkImage(
                                      imageUrl: 'https://salt.tikicdn.com/cache/280x280/ts/product/c1/39/78/ff160d39fffed050376be9974d6da23d.png.webp',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  'New Balance Cushioning',
                                  style: TextStyle(
                                      color: Colors.red),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      "230000.0 \$",
                                      style: TextStyle(
                                          color: Colors.blueAccent),
                                    ),
                                    Text("Shoes")
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ]));
        });
  }
}
