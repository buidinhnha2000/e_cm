
import 'package:flutter/material.dart';

import '../../../widget/icon_funtion.dart';
import '../../../widget/icon_setting.dart';


class ProfileHeader extends StatefulWidget {
  const ProfileHeader({super.key});


  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey[800],
      height: 180,
      child: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all( 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconSetting(),
                    IconFuntion(color: Colors.white,icon: Icons.shopping_cart_outlined, onPress: () {
                      // Navigator.pushReplacement(context,
                      //     MaterialPageRoute(builder: (context) => Cart()));
                    }, notification: 20,),
                    IconFuntion(color: Colors.white,icon: Icons.chat, onPress: () {  }, notification: 15,),
                  ],
                ),
                Row(
                  children: [
                    const SizedBox(
                      height: 70,
                      width: 70,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/image4.jpg'),
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("buinha", style: TextStyle(color: Colors.white70, fontSize: 25, fontWeight: FontWeight.w600),),
                        const SizedBox(height: 5,),
                        const Text("Thanh vien",style: TextStyle(color: Colors.white38),),
                        const SizedBox(height: 10,),
                        Row(
                          children:const [
                            Text("Follow",style: TextStyle(color: Colors.white54),),
                            SizedBox(width: 5,),
                            Text("40",style: TextStyle(color: Colors.deepOrange),),
                            SizedBox(width: 30,),
                            Text("Dang Follow",style: TextStyle(color: Colors.white54),),
                            SizedBox(width: 5,),
                            Text("100",style: TextStyle(color: Colors.deepOrange),),
                          ],
                        )
                      ],
                    )
                  ],
                )
              ],
            )
        ),
      ),
    );
  }

}
