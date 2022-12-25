
import 'package:flutter/material.dart';

import '../../page/product_detail/component/product_detail_header.dart';
import '../../widget/icon_search.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}
class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return getBody();
  }

  Widget getBody() {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,

          actions:const [ProductDetailHeader()],
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
                          children: const [
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