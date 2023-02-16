import 'package:e_cm/data/model/order/order.dart';
import 'package:e_cm/data/network/helper/secure_storage.dart';
import 'package:e_cm/data/network/remote.dart';
import 'package:e_cm/l10n/l10n.dart';
import 'package:flutter/material.dart';
import '../../../page/product_detail/component/product_detail_header.dart';

final order = GetDataSource();

class ProfileOrderHistory extends StatelessWidget {
  const ProfileOrderHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          actions: const [
            ProductDetailHeader(),
          ],
          title: Text(
            context.l10n!.text_profile_order_history,
            style: const TextStyle(color: Colors.white, fontSize: 23),
          ),
        ),
        body: Container(
          height: 2000,
          child: FutureBuilder<List<Order>>(
              future: GetDataSource().getOrder(),
              builder: (context, snapshot) {
                return FutureBuilder<String?>(
                    future: secureStorage.getUserId(),
                    builder: (context, snapshotUserId) {
                      if(snapshot.hasData && snapshot.data != null) {
                        return ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: snapshot.data?.length ?? 0,
                            itemBuilder: (context, index) {
                              return Text(
                                '${snapshot.data![index].amount}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                    color: Colors.white
                                ),
                              );
                            });
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    });
              }),
        ));
  }
}
