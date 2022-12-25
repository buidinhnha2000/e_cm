
import 'package:e_cm/app/navigator/router.dart';
import 'package:flutter/material.dart';

class ProfileFunction extends StatelessWidget {
  const ProfileFunction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    routeIntroduction() {
      Navigator.of(context)
          .pushNamed(AppRoutes.introduction);
    }
    return Container(
        color: Colors.black45,
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.all(0),
          children: [
            GestureDetector(
              onTap: (){
                routeIntroduction();
              },
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Icons.account_balance_outlined,
                          color: Colors.pink,
                          size: 25,
                        ),
                        SizedBox(width: 10,),
                        Text("About App", style: TextStyle(fontSize: 15, color: Colors.white70),)
                      ],
                    ),
                    const Icon(Icons.navigate_next, color: Colors.white30,)
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: (){},
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Icons.contact_support_outlined,
                          color: Colors.red,
                          size: 25,
                        ),
                        SizedBox(width: 10,),
                        Text("Support", style: TextStyle(fontSize: 15, color: Colors.white70),)
                      ],
                    ),
                    const Icon(Icons.navigate_next, color: Colors.white30,)
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: (){},
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Icons.settings_outlined,
                          color: Colors.green,
                          size: 25,
                        ),
                        SizedBox(width: 10,),
                        Text("Account Settings", style: TextStyle(fontSize: 15, color: Colors.white70),)
                      ],
                    ),
                    const Icon(Icons.navigate_next, color: Colors.white30,)
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: (){},
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Icons.logout_outlined,
                          color: Colors.blue,
                          size: 25,
                        ),
                        SizedBox(width: 10,),
                        Text("Logout", style: TextStyle(fontSize: 15, color: Colors.white70),)
                      ],
                    ),
                    const Icon(Icons.navigate_next, color: Colors.white30,)
                  ],
                ),
              ),
            ),
          ],
        )
    );
  }
}
