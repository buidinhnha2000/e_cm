import 'package:e_cm/app/navigator/router.dart';
import 'package:e_cm/data/model/address/address.dart';
import 'package:e_cm/data/network/helper/secure_storage.dart';
import 'package:e_cm/data/network/remote.dart';
import 'package:e_cm/l10n/l10n.dart';
import 'package:flutter/material.dart';
import '../../../page/product_detail/component/product_detail_header.dart';

final address = GetDataSource();

class AddressList extends StatelessWidget {
  const AddressList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: const [
          ProductDetailHeader(),
        ],
        title: Text(
          context.l10n!.text_address_list,
          style: const TextStyle(color: Colors.white, fontSize: 23),
        ),
      ),
      body: Column(
        children: [
          FutureBuilder<List<Address>>(
              future: address.getAddressId(),
              builder: (context, snapshot) {
                return FutureBuilder<String?>(
                    future: secureStorage.getUserId(),
                    builder: (context, snapshotUserId) {
                      if (snapshotUserId.hasData &&
                          snapshotUserId.data != null) {
                        return ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: snapshot.data?.length ?? 0,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {},
                                child: Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  color: Colors.black38,
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 7,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      snapshot.data![index].name
                                                          .toString(),
                                                      style: const TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                    const SizedBox(
                                                      width: 20,
                                                    ),
                                                    const Text(
                                                      "(+84) ",
                                                      style: TextStyle(
                                                          color:
                                                              Colors.white60),
                                                    ),
                                                    Text(
                                                      snapshot
                                                          .data![index].phone
                                                          .toString(),
                                                      style: const TextStyle(
                                                          color:
                                                              Colors.white60),
                                                    )
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                    "${snapshot.data![index].address}",
                                                    style: const TextStyle(
                                                        color: Colors.white60)),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                    "${snapshot.data![index].city}, ${snapshot.data![index].country}",
                                                    style: const TextStyle(
                                                        color: Colors.white60)),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                              child: IconButton(
                                                  onPressed: () {},
                                                  icon: const Icon(
                                                    Icons.location_on_outlined,
                                                    color: Colors.green,
                                                  )))
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                        height: 30,
                                        width: 100,
                                        child: OutlinedButton(
                                            style: OutlinedButton.styleFrom(
                                              side: const BorderSide(
                                                  width: 1,
                                                  color: Colors.blueAccent),
                                            ),
                                            onPressed: () {},
                                            child: const Text("Default",
                                                style: TextStyle(
                                                    color: Colors.blueAccent))),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    });
              }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed(AppRoutes.address);
          },
          backgroundColor: Colors.red,
          child: const Icon(Icons.add, color: Colors.white)),
    );
  }
}
