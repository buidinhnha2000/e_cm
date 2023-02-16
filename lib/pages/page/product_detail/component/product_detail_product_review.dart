import 'package:e_cm/data/network/helper/secure_storage.dart';
import 'package:e_cm/data/network/remote.dart';
import 'package:e_cm/pages/page/product_detail/bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../../data/model/product/product.dart';
import '../../../../data/model/rating/rating.dart';
import 'package:intl/intl.dart';

final ratingGet = GetDataSource();

class ProductReviewProductDetail extends StatefulWidget {
  const ProductReviewProductDetail({Key? key, required this.products})
      : super(key: key);
  final Product products;

  @override
  State<ProductReviewProductDetail> createState() =>
      _ProductReviewProductDetailState();
}

class _ProductReviewProductDetailState
    extends State<ProductReviewProductDetail> {
  late TextEditingController response;
  late double rating;

  @override
  void initState() {
    response = TextEditingController();
    rating = 5.0;
    super.initState();
  }

  void clearRespone() {
    FocusScope.of(context).unfocus();
    response.clear();
  }

  @override
  Widget build(BuildContext context) {
    final ratingBloc = BlocProvider.of<ProductBloc>(context);
    IconData? selectedIcon;
    final productId = widget.products.productId;
    return Column(
      children: [
        Container(
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
                    "Comments",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                FutureBuilder<List<Rating>>(
                    future: ratingGet.getRating(
                        productId: widget.products.productId),
                    builder: (context, snapshot) {
                      return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: snapshot.data?.length ?? 0,
                          itemBuilder: (context, index) {
                            DateTime? date = snapshot.data?[index].createdAt;
                            return Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 10, top: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 50,
                                        width: 50,
                                        child: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/user2.png'),
                                          backgroundColor: Colors.white,
                                          foregroundColor: Colors.amber,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${snapshot.data![index].userId}',
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              RatingBarIndicator(
                                                rating: snapshot
                                                    .data![index].rating!
                                                    .toDouble(),
                                                itemBuilder: (context, index) =>
                                                    const Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                ),
                                                itemCount: 5,
                                                itemSize: 20.0,
                                                direction: Axis.horizontal,
                                              ),
                                              const SizedBox(width: 90,),
                                              Text(
                                                DateFormat('HH:mm - dd-MM-yyyy').format(date!),
                                                style: const TextStyle(
                                                    color: Colors.redAccent),
                                              )
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(5),
                                    width: MediaQuery.of(context).size.width,
                                    decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      color: Colors.white12,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          snapshot.data![index].response
                                              .toString(),
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          });
                    }),
              ],
            )),
        Container(
          padding: const EdgeInsets.all(10),
          color: Colors.black45,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "My rating",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 17,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  RatingBar.builder(
                    initialRating: rating,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 30,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                    itemBuilder: (context, _) => Icon(
                      selectedIcon ?? Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (value) {
                      // rating = value.toInt();
                    },
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: TextField(
                  controller: response,

                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 150,
                    padding: const EdgeInsets.only(right: 10),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                              width: 1, color: Colors.blueAccent)),
                      onPressed: () async {
                        final userId = await secureStorage.getUserId();
                        if (userId?.isNotEmpty == true) {
                          ratingBloc.add(OnRatingEvent(
                              userId!,
                              productId.trim(),
                              response.text.trim(),
                              rating.toInt()));
                        }
                        clearRespone();
                      },
                      child: const Text("Send",
                          style: TextStyle(color: Colors.blue, fontSize: 15)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
