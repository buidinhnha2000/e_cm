import 'package:e_cm/pages/screen/home_screen/component/home_banner.dart';
import 'package:e_cm/pages/screen/home_screen/component/home_product.dart';
import 'package:flutter/material.dart';

import 'component/mall_header.dart';
import 'component/mall_trademark.dart';

class MallScreen extends StatefulWidget {
  const MallScreen({Key? key}) : super(key: key);

  @override
  State<MallScreen> createState() => _MallScreenState();
}

class _MallScreenState extends State<MallScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    return Scaffold(
        body: Stack(
      children: [
        Stack(
          children: [
            ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              padding: const EdgeInsets.all(0.0),
              children: [
                Stack(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 90),
                          child: HomeBanner(),
                        ),
                        const MallTrademark(),
                        const SizedBox(
                          height: 5,
                        ),
                        const MallTrademark(),
                        const HomeProduct(),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        const MallHeader(),
      ],
    ));
  }
}
