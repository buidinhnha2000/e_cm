import 'package:e_cm/pages/page/product_detail/component/product_detail_header.dart';
import 'package:e_cm/pages/widget/icon_search.dart';
import 'package:flutter/material.dart';
import '../home/component/home_banner.dart';
import '../home/component/home_product.dart';
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
        appBar: AppBar(
          backgroundColor: Colors.black,
          actions: const [ProductDetailHeader()],
          title: const IconSearch(color: Colors.white24),
        ),
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
                            HomeBanner(),
                            const MallTrademark(),
                            const SizedBox(
                              height: 5,
                            ),
                            const MallTrademark(),
                            const SizedBox(
                              height: 5,
                            ),
                            const HomeProduct(),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ));
  }
}
