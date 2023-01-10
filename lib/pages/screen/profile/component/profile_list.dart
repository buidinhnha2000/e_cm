import 'package:e_cm/app/navigator/router.dart';
import 'package:flutter/material.dart';

class ProfileList extends StatelessWidget {
  const ProfileList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black45,
        child: ListView(
          padding: const EdgeInsets.all(0),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: [
            GestureDetector(
              onTap: (){
                Navigator.of(context).pushNamed(AppRoutes.addressList);
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Icons.pin_drop_outlined,
                          color: Colors.lightGreenAccent,
                          size: 25,
                        ),
                        SizedBox(width: 10,),
                        Text("Delivery address", style: TextStyle(fontSize: 15, color: Colors.white70),)
                      ],
                    ),
                    const Icon(Icons.navigate_next, color: Colors.white30,)
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.of(context).pushNamed(AppRoutes.orderHistory);
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Icons.shopify_outlined,
                          color: Colors.red,
                          size: 25,
                        ),
                        SizedBox(width: 10,),
                        Text("Order History", style: TextStyle(fontSize: 15, color: Colors.white70),)
                      ],
                    ),
                    Row(
                      children: const [
                        Text("5 order", style: TextStyle(fontSize: 13, color: Colors.white38),),
                        Icon(Icons.navigate_next, color: Colors.white30,)
                      ],
                    )
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
                          Icons.access_time_outlined,
                          color: Colors.blue,
                          size: 25,
                        ),
                        SizedBox(width: 10,),
                        Text("View", style: TextStyle(fontSize: 15, color: Colors.white70),)
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
                          Icons.star_border_rounded,
                          color: Colors.green,
                          size: 25,
                        ),
                        SizedBox(width: 10,),
                        Text("My Rating", style: TextStyle(fontSize: 15, color: Colors.white70),)
                      ],
                    ),
                    Row(
                      children: const [
                        Text("3 Sao", style: TextStyle(fontSize: 13, color: Colors.white38),),
                        Icon(Icons.navigate_next, color: Colors.white30,)
                      ],
                    )
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
                          Icons.attach_money_outlined,
                          color: Colors.yellow,
                          size: 25,
                        ),
                        SizedBox(width: 10,),
                        Text("Coin", style: TextStyle(fontSize: 15, color: Colors.white70),)
                      ],
                    ),
                    Row(
                      children: const [
                        Text("0 Coin", style: TextStyle(fontSize: 13, color: Colors.white38),),
                        Icon(Icons.navigate_next, color: Colors.white30,)
                      ],
                    )
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
                          Icons.assistant_photo_rounded,
                          color: Colors.orange,
                          size: 25,
                        ),
                        SizedBox(width: 10,),
                        Text("Customers", style: TextStyle(fontSize: 15, color: Colors.white70),)
                      ],
                    ),
                    Row(
                      children: const [
                        Text("Member", style: TextStyle(fontSize: 13, color: Colors.white38),),
                        Icon(Icons.navigate_next, color: Colors.white30,)
                      ],
                    )
                  ],
                ),
              ),
            ),

          ],
        )
    );
  }
}
