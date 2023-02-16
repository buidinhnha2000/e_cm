import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_cm/data/model/product/product.dart';
import 'package:e_cm/data/network/remote.dart';
import 'package:e_cm/pages/page/card/widget/card_detail.dart';
import 'package:e_cm/pages/page/card/widget/elevate_buton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../app/navigator/router.dart';
import '../../../data/model/cart/cart.dart';
import '../../../data/network/helper/secure_storage.dart';
import 'bloc/card_bloc.dart';

final cart = GetDataSource();

class CardScreen extends StatefulWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  late bool keyShow = true;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CardBloc, CardState>(
      listener: (context, state) {
        if (state is PaymentCreateMethodState || state is PaymentCreateIntentState) {
          Navigator.of(context).pushNamed(AppRoutes.home);
        }else{
          Navigator.of(context).pushNamed(AppRoutes.home);
        }
      },
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Stack(
            children: [
              keyShow
                  ? ListView(
                      scrollDirection: Axis.vertical,
                      children: [
                        _pageTitle(),
                        CardDetail(
                          keyShow: keyShow,
                        ),
                      ],
                    )
                  : ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      children: [
                        _topSheet(),
                        CardDetail(
                          keyShow: keyShow,
                        ),
                      ],
                    ),
              keyShow ? _headerPage() : _headerSheet(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _headerPage() {
    return Container(
      color: Colors.black,
      child: SafeArea(
          child: Padding(
        padding:
            const EdgeInsets.only(top: 20, left: 24, right: 24, bottom: 10),
        child: SizedBox(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/logon1.png'),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Payment',
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black,
                        ),
                  )
                ],
              ),
              _button()
            ],
          ),
        ),
      )),
    );
  }

  Widget _pageTitle() {
    return SizedBox(
      height: 370,
      child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 80),
        child: Center(
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 280,
                    width: 146,
                    child: Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 140,
                              width: double.infinity,
                              child: Stack(
                                children: [
                                  Center(
                                    child: SizedBox(
                                      height: 120,
                                      width: 120,
                                      child: FutureBuilder(
                                          future: cart.getProduct(),
                                          builder: (context, snapshot) {
                                            if (snapshot.hasData &&
                                                snapshot.data != null) {
                                              return ListView.builder(
                                                  shrinkWrap: true,
                                                  itemCount: 1,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return CachedNetworkImage(
                                                      imageUrl:
                                                          snapshot.data![1].img,
                                                      imageBuilder: (context,
                                                              imageProvider) =>
                                                          Container(
                                                        width: 120.0,
                                                        height: 120.0,
                                                        decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                                image:
                                                                    imageProvider,
                                                                fit: BoxFit
                                                                    .fill),
                                                            borderRadius:
                                                                const BorderRadius
                                                                        .all(
                                                                    Radius.circular(
                                                                        10))),
                                                      ),
                                                    );
                                                  });
                                            }
                                            return const Center(
                                              child: CircularProgressIndicator(
                                                color: Colors.white,
                                              ),
                                            );
                                          }),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 120),
                                    child: Center(
                                      child: SizedBox(
                                          height: 40,
                                          width: 67,
                                          child: ElevateButon(
                                            onPressed: () {
                                              setState(() {
                                                keyShow = !keyShow;
                                              });
                                            },
                                            text: '3 Items',
                                            color: Colors.black,
                                            icon: Icons.navigate_next_rounded,
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text('Pay Ecommerce',
                                style: Theme.of(context).textTheme.headline6),
                            const SizedBox(
                              height: 20,
                            ),
                            FutureBuilder<List<Cart>>(
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
                                            return Text('$total',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline5
                                                    ?.copyWith());
                                          } else {
                                            return const Center(child: CircularProgressIndicator());
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
                                }),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _headerSheet() {
    return Container(
      color: Colors.black,
      child: SafeArea(
          child: Padding(
        padding:
            const EdgeInsets.only(top: 20, left: 24, right: 24, bottom: 10),
        child: SizedBox(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/logon1.png'),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Payment',
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black,
                        ),
                  )
                ],
              ),
              _button()
            ],
          ),
        ),
      )),
    );
  }

  Widget _topSheet() {
    return SizedBox(
      height: 370,
      child: Padding(
        padding: const EdgeInsets.only(top: 60),
        child: Column(
          children: [
            _listPay(),
            _totalPay(),
          ],
        ),
      ),
    );
  }

  Widget _listPay() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: FutureBuilder<List<Product>>(
          future: cart.getProduct(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              return ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(left: 24, right: 24, top: 20),
                      child: GestureDetector(
                        child: SizedBox(
                          height: 48,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: SizedBox(
                                  height: 48,
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(5.0)),
                                    child: CachedNetworkImage(
                                        imageUrl: snapshot.data![index].img,
                                        fit: BoxFit.fill),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                  flex: 5,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(snapshot.data![index].title,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline6
                                                  ?.copyWith(
                                                      color: Colors.white)),
                                          Text(
                                              "\$ ${snapshot.data![index].price * snapshot.data![index].quantity!.toDouble()}",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline6
                                                  ?.copyWith(
                                                      color: Colors.white))
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Text('Qty',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall
                                                      ?.copyWith(
                                                          fontWeight:
                                                              FontWeight.w600)),
                                              const SizedBox(
                                                width: 7,
                                              ),
                                              Text(
                                                  '${snapshot.data![index].quantity}',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall
                                                      ?.copyWith(
                                                          fontWeight:
                                                              FontWeight.w600)),
                                              const SizedBox(
                                                width: 0,
                                              ),
                                              const Icon(
                                                Icons.expand_more,
                                                color: Colors.white54,
                                                size: 22,
                                              )
                                            ],
                                          ),
                                          Text(
                                              '\$ ${snapshot.data![index].price} each',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall
                                                  ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.normal)),
                                        ],
                                      )
                                    ],
                                  )),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            }
            return const SizedBox(
              height: 136,
              child: Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            );
          }),
    );
  }

  Widget _totalPay() {
    return Row(
      children: [
        Expanded(flex: 1, child: Container()),
        Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(top: 30, left: 24, right: 24),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Subtotal',
                          style: Theme.of(context).textTheme.headline6),
                      Text('\$129.00',
                          style: Theme.of(context).textTheme.headline6)
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Divider(
                    color: Colors.black,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Sales tax(6.5%)',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text('\$4.23',
                          style: Theme.of(context).textTheme.bodyMedium)
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Divider(
                    color: Colors.black,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total due',
                          style: Theme.of(context).textTheme.headline6),
                      Text('\$133.23',
                          style: Theme.of(context).textTheme.headline6)
                    ],
                  ),
                ],
              ),
            ))
      ],
    );
  }

  Widget _button() {
    return TextButton(
        onPressed: () {
          setState(() {
            keyShow = !keyShow;
          });
        },
        child: Row(
          children: [
            Text(
              keyShow ? 'Details' : 'Close',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black54,
                  ),
            ),
            Icon(keyShow ? Icons.expand_more : Icons.keyboard_arrow_up,
                color: Colors.white54),
          ],
        ));
  }
}
