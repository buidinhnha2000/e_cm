import 'package:e_cm/pages/screen/profile/component/profile_function.dart';
import 'package:e_cm/pages/screen/profile/component/profile_header.dart';
import 'package:e_cm/pages/screen/profile/component/profile_list.dart';
import 'package:e_cm/pages/screen/profile/component/profile_product.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        padding: const EdgeInsets.all(0),
        children: [
          ProfileHeader(),
          SizedBox(height: 5,),
          ProfileProduct(),
          SizedBox(height: 5,),
          ProfileFunction(),
          SizedBox(height: 5,),
          ProfileList(),
        ],
    );
  }
}
