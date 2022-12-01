
import 'package:flutter/material.dart';

import '../../../widget/item.dart';


class HomeCategori extends StatelessWidget {
  const HomeCategori({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(listCategori.length, (index) {
            return GestureDetector(
              onTap: null,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white),
                    height: 50,
                    width: 50,
                    padding: const EdgeInsets.all(3),
                    child: Icon(
                      listCategori[index].icon,
                      color: Colors.red,
                      size: 30,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    listCategori[index].text,
                    style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            );
          })),
    );
  }
}