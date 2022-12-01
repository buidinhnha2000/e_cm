import 'package:e_cm/pages/screen/home_screen/home_screen.dart';
import 'package:e_cm/pages/screen/profile/profile.dart';
import 'package:flutter/material.dart';
import '../../pages/screen/mall/mall.dart';
import '../../pages/screen/notification/notification.dart';
import '../../pages/widget/item.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _selectedIndex = 0;

  void _onBottomAppBarClicked(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static List<Widget> pages = <Widget>[
    HomeScreen(),
    MallScreen(),
    NotificationScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.blueGrey,
          backgroundColor: Colors.black,
          selectedItemColor: Colors.tealAccent,
          onTap: _onBottomAppBarClicked,
          currentIndex: _selectedIndex,
          items: List.generate(items.length, (index) {
            return BottomNavigationBarItem(
                icon: Icon(items[index].icon), label: items[index].text);
          })),
    );
  }

// Widget getFooter() {
//   return Container(
//       height: 50,
//       decoration: const BoxDecoration(
//         color: Colors.black,
//       ),
//       child: Padding(
//         padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
//         child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: List.generate(items.length, (index) {
//               return GestureDetector(
//                 onTap: () {
//                   _onBottomAppBarClicked(index);
//                 },
//                 child: Column(
//                   children: [
//                     Icon(
//                       items[index].icon,
//                       color: Colors.blueGrey[200],
//                       size: 27,
//                     ),
//                     const SizedBox(
//                       height: 2,
//                     ),
//                     Text(
//                       items[index].text,
//                       style: const TextStyle(
//                           fontSize: 12,
//                           color: Colors.blueGrey,
//                           fontWeight: FontWeight.w500),
//                     )
//                   ],
//                 ),
//               );
//             })),
//       ));
// }
}
