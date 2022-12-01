import 'package:flutter/material.dart';

class HomeQr extends StatelessWidget {
  const HomeQr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.only(left: 20, right: 20, top: 200),
      child: Container(
          height: 60,
          decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.circular(3)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Expanded(
                  flex: 1,
                  child: Icon(
                    Icons.qr_code,
                    size: 25,
                    color: Colors.white60,
                  )),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 2, bottom: 2, right: 5, left: 5),
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          Icon(
                            Icons.schedule,
                            color: Colors.redAccent,
                            size: 20,
                          ),
                          Text(
                            " Bui Dinh Nha",
                            style: TextStyle(fontSize: 15),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      const Text(
                        "Giam 100K cho 100 don hang dau tien",
                        style: TextStyle(
                            color: Colors.white54,
                            fontSize: 12),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 2, bottom: 2, right: 5, left: 5),
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          Icon(
                            Icons.schedule,
                            color: Colors.yellow,
                            size: 20,
                          ),
                          Text(
                            " Suppermen",
                            style: TextStyle(fontSize: 15),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      const Text(
                        "Giam 100K cho 100 don hang dau tien",
                        style: TextStyle(
                            color: Colors.white54,
                            fontSize: 12),
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
