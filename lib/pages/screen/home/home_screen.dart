import 'package:e_cm/data/network/remote.dart';
import 'package:flutter/material.dart';
import 'component/home_banner.dart';
import 'component/home_categori.dart';
import 'component/home_header.dart';
import 'component/home_product.dart';
import 'component/home_qr.dart';
import 'component/home_sale.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final movie = GetDataSource();

class _HomeScreenState extends State<HomeScreen> {
  final _scrollController = TrackingScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _getBody());
  }

  Widget _getBody() {
    return Stack(
      children: [
        Stack(
          children: [
            ListView(
              controller: _scrollController,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              padding: const EdgeInsets.all(0.0),
              children: [
                Stack(
                  children: [
                    Column(
                      children: [
                        HomeBanner(),
                        Container(
                          height: 55,
                          color: Colors.lightBlueAccent,
                        ),
                        Container(
                          height: 100,
                          color: Colors.lightBlue,
                          child: const HomeCategori(),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const HomeSale(),
                        const HomeProduct(),
                      ],
                    ),
                    const HomeQr(),
                  ],
                ),
              ],
            ),
          ],
        ),
        HomeHeader(_scrollController),
      ],
    );
  }
}
