import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_cm/data/network/helper/secure_storage.dart';
import 'package:e_cm/data/network/remote.dart';
import 'package:e_cm/pages/page/product_detail/bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../../../data/model/cart/cart.dart';

final cart = GetDataSource();
final user = secureStorage.getUserId();

class CartProducts extends StatefulWidget {
  const CartProducts({Key? key}) : super(key: key);

  @override
  State<CartProducts> createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Cart>>(
        future: cart.getCart(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            return FutureBuilder<String?>(
                future: secureStorage.getUserId(),
                builder: (context, snapshotUserId) {
                  if (snapshotUserId.hasData && snapshotUserId.data != null) {
                    var total = 0.0;
                    snapshot.data?.forEach((element) {
                      total = total + (element.quantity!.toDouble() * element.product!.price);
                    });
                    return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data?.length ?? 0,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, right: 10, left: 10),
                              child: Slidable(
                                key: const ValueKey(0),
                                endActionPane: ActionPane(
                                  motion: const ScrollMotion(),
                                  dismissible:
                                      DismissiblePane(onDismissed: () {}),
                                  children: const [
                                    SlidableAction(
                                      onPressed: null,
                                      backgroundColor: Color(0xFF21B7CA),
                                      foregroundColor: Colors.white,
                                      icon: Icons.share,
                                      label: 'Share',
                                    ),
                                    SlidableAction(
                                      onPressed: null,
                                      backgroundColor: Color(0xFFFE4A49),
                                      foregroundColor: Colors.white,
                                      icon: Icons.delete,
                                      label: 'Delete',
                                    ),
                                  ],
                                ),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(5),
                                        topLeft: Radius.circular(5)),
                                    color: Colors.black54,
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          flex: 2,
                                          child: ClipRRect(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(5)),
                                            child: CachedNetworkImage(
                                              imageUrl: snapshot
                                                  .data![index].product!.img,
                                              fit: BoxFit.fill,
                                            ),
                                          )),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                          flex: 5,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  snapshot.data![index].product!
                                                      .title,
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 17)),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                "${snapshot.data![index].product!.price} \$",
                                                style: TextStyle(
                                                    color:
                                                        Colors.redAccent[400],
                                                    fontSize: 20),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      IconButton(
                                                          onPressed: () async {
                                                            final cart = CartProduct(
                                                                userId: await secureStorage
                                                                    .getUserId(),
                                                                productId: snapshot
                                                                    .data![
                                                                        index]
                                                                    .product!
                                                                    .productId,
                                                                quantity: (snapshot
                                                                        .data![
                                                                            index]
                                                                        .quantity! -
                                                                    1));
                                                            setState(() {
                                                              context.read<ProductBloc>()
                                                                  .add(
                                                                  IncrementQuantityProductEvent(
                                                                      cart));
                                                            });
                                                          },
                                                          icon: const Icon(
                                                            Icons.remove,
                                                            color:
                                                                Colors.white70,
                                                          )),
                                                      Text(
                                                          snapshot.data![index]
                                                              .quantity
                                                              .toString(),
                                                          style: const TextStyle(
                                                              color: Colors
                                                                  .white70,
                                                              fontSize: 15)),
                                                      IconButton(
                                                          onPressed: () {},
                                                          icon: const Icon(
                                                            Icons.add,
                                                            color:
                                                                Colors.white70,
                                                          )),
                                                    ],
                                                  ),
                                                  Text(
                                                    "${snapshot.data![index].product!.price * snapshot.data![index].quantity!.toDouble()} \$",
                                                    style: const TextStyle(
                                                        color:
                                                            Colors.blueAccent,
                                                        fontSize: 20),
                                                  ),
                                                ],
                                              )
                                            ],
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        });
                  } else {
                    return const CircularProgressIndicator();
                  }
                });
            // }
          }
          return const Padding(
            padding: EdgeInsets.only(top: 300.0),
            child: Center(
              child: CircularProgressIndicator(
                color: Colors.redAccent,
              ),
            ),
          );
        });
  }
}
