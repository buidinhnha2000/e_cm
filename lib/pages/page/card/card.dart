import 'package:e_cm/pages/page/card/widget/card_detail.dart';
import 'package:e_cm/pages/page/card/widget/elevate_buton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../app/navigator/router.dart';
import 'bloc/card_bloc.dart';

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
        if (state is LoadingCard) {}
        if (state is SuccessCard) {
          Navigator.of(context).pushNamed(AppRoutes.home);
        }
        if (state is FailedCard) {}
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
              ListView(
                scrollDirection: Axis.vertical,
                children: [
                  keyShow ? _pageTitle() : _topSheet(),
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
                        backgroundImage: AssetImage('assets/images/logo2.jpg'),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Powdur',
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
                                    child: Container(
                                      height: 120,
                                      width: 120,
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                              'assets/images/img1.jpg',
                                            ),
                                            fit: BoxFit.fill,
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))),
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
                            Text(
                              'Pay Powdur',
                              style: Theme.of(context).textTheme.headline6
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              '\$133.23',
                              style: Theme.of(context).textTheme.headline5?.copyWith(

                              )
                            ),
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
    return SafeArea(
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
                      backgroundImage: AssetImage('assets/images/logo2.jpg'),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Powdur',
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
        ));
  }

  Widget _topSheet() {
    return Container(
      height: 370,
      width: double.infinity,
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
      padding: const EdgeInsets.only(left: 24, right: 24),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: GestureDetector(
              child: SizedBox(
                height: 48,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  'assets/images/img2.jpg',
                                ),
                                fit: BoxFit.fill),
                            borderRadius:
                            BorderRadius.all(Radius.circular(5.0))),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Puse set',
                                    style: Theme.of(context).textTheme.headline6
                                        ?.copyWith(
                                        color: Colors.white)),
                                Text('\$ 64.00',
                                    style: Theme.of(context).textTheme.headline6
                                        ?.copyWith(
                                        color: Colors.white))
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text('Qty',
                                        style: Theme.of(context).textTheme.bodySmall
                                            ?.copyWith(
                                            fontWeight: FontWeight.w600)),
                                    const SizedBox(
                                      width: 7,
                                    ),
                                    Text('2',
                                        style: Theme.of(context).textTheme.bodySmall
                                            ?.copyWith(
                                            fontWeight: FontWeight.w600)),
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
                                Text('\$ 32.00 each',
                                    style: Theme.of(context).textTheme.bodySmall
                                        ?.copyWith(
                                        fontWeight: FontWeight.normal)),
                              ],
                            )
                          ],
                        )),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: GestureDetector(
              child: SizedBox(
                height: 48,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  'assets/images/img2.jpg',
                                ),
                                fit: BoxFit.fill),
                            borderRadius:
                            BorderRadius.all(Radius.circular(5.0))),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Puse set',
                                    style: Theme.of(context).textTheme.headline6
                                        ?.copyWith(
                                        color: Colors.white)),
                                Text('\$ 64.00',
                                    style: Theme.of(context).textTheme.headline6
                                        ?.copyWith(
                                        color: Colors.white))
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text('Qty',
                                        style: Theme.of(context).textTheme.bodySmall
                                            ?.copyWith(
                                            fontWeight: FontWeight.w600)),
                                    const SizedBox(
                                      width: 7,
                                    ),
                                    Text('2',
                                        style: Theme.of(context).textTheme.bodySmall
                                            ?.copyWith(
                                            fontWeight: FontWeight.w600)),
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
                                Text('\$ 32.00 each',
                                    style: Theme.of(context).textTheme.bodySmall
                                        ?.copyWith(
                                        fontWeight: FontWeight.normal)),
                              ],
                            )
                          ],
                        )),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
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
                      Text(
                        'Subtotal',
                        style: Theme.of(context).textTheme.headline6
                      ),
                      Text(
                        '\$129.00',
                        style: Theme.of(context).textTheme.headline6
                      )
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
                      Text(
                        '\$4.23',
                        style: Theme.of(context).textTheme.bodyMedium
                      )
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
                        'Total due',
                        style: Theme.of(context).textTheme.headline6
                      ),
                      Text(
                        '\$133.23',
                        style: Theme.of(context).textTheme.headline6
                      )
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
