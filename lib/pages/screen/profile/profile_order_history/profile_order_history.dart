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
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(columns: const [
            DataColumn(
              label: Text(
                "STT",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
            ),
            DataColumn(
              label: Text(
                "ID",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
            ),
            DataColumn(
              label: Text(
                "Amount",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
            )
          ], rows: []),
        ));
  }
}
