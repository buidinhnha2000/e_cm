
import 'package:flutter/material.dart';

import '../../../widget/icon_funtion.dart';
import '../../../widget/icon_search.dart';

class MallHeader extends StatefulWidget {
  const MallHeader({super.key});


  @override
  State<MallHeader> createState() => _MallHeaderState();
}

class _MallHeaderState extends State<MallHeader> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              const IconSearch(color: Colors.white38,),
              IconFuntion(
                color: Colors.white60,
                icon: Icons.shopping_cart_outlined,
                onPress: () {
                  // Navigator.pushReplacement(context,
                  //     MaterialPageRoute(builder: (context) => Cart()));
                },
                notification: 20,),
              IconFuntion(
                color: Colors.white60,
                icon: Icons.chat,
                onPress: () {},
                notification: 15,),
            ],
          ),
        ),
      ),
    );
  }
}