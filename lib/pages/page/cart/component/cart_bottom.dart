import 'package:e_cm/app/navigator/router.dart';
import 'package:e_cm/data/network/helper/secure_storage.dart';
import 'package:e_cm/data/network/remote.dart';
import 'package:flutter/material.dart';

import '../../../../data/model/cart/cart.dart';

final cart = GetDataSource();
final userId = secureStorage.getUserId();

class CartBottom extends StatefulWidget {
  const CartBottom({Key? key}) : super(key: key);

  @override
  State<CartBottom> createState() => _CartBottomState();
}

class _CartBottomState extends State<CartBottom> {
  @override
  Widget build(BuildContext context) {
    // final cartBloc = BlocProvider.of<CartBloc>(context);

    return BottomAppBar(
      height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder<List<Cart>>(
                future: cart.getCart(),
                builder: (BuildContext context, snapshot) {
                  if (snapshot.hasData && snapshot.data != null) {
                    return FutureBuilder<String?>(
                        future: secureStorage.getUserId(),
                        builder: (context, snapshotUserId) {
                          if (snapshotUserId.hasData && snapshotUserId.data != null) {
                            var total = 0.0;
                            snapshot.data?.forEach((element) {
                              total = total + (element.quantity!.toDouble() * element.product!.price);
                            });
                            return Container(
                              height: 40,
                              width: 170,
                              padding: const EdgeInsets.all(3.0),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.blueAccent),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(child: Text("$total \$")),
                            );
                          } else {
                            return const CircularProgressIndicator();
                          }
                        });
                    // }
                  }
                  return const Padding(
                    padding: EdgeInsets.only(top: 300.0),
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Colors.redAccent,
                      ),
                    ),
                  );
                }),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              height: 40,
              width: 170,
              child: OutlinedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.redAccent[400])),
                  onPressed: () async {
                    Navigator.of(context).pushNamed(AppRoutes.card);
                    // cartBloc.add(AddToOrder());
                  },
                  child: const Center(
                    child: Text(
                      'Payment',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  )),
            )
          ],
        ));
  }
}
