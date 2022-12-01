import 'package:e_cm/pages/screen/profile/component/profile_header.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return getBody();
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
                    Column(
                      children: [
                        Container(height: 2000,)
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const ProfileHeader(),
          ],
        ));
  }
}
