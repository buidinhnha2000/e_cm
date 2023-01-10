
import 'package:e_cm/data/network/helper/secure_storage.dart';
import 'package:e_cm/l10n/l10n.dart';
import 'package:e_cm/pages/page/product_detail/component/product_detail_header.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatefulWidget {
  const ProfileHeader({super.key});


  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {

  @override
  Widget build(BuildContext context) {
    final data = secureStorage.getUserId().toString();
    return Container(
      color: Colors.black,
      height: 180,
      child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  ProductDetailHeader()
                  ]
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
                      const Text("BuiNha", style: TextStyle(color: Colors.white70, fontSize: 15, fontWeight: FontWeight.w600),),
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
    );
  }

}
