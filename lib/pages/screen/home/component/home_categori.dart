import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_cm/app/navigator/router.dart';
import 'package:e_cm/data/network/remote.dart';
import 'package:e_cm/l10n/l10n.dart';
import 'package:flutter/material.dart';

import '../../../../data/model/categories/categories.dart';

final category = GetDataSource();

class HomeCategori extends StatelessWidget {
  const HomeCategori({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    routeCategories() {
      Navigator.of(context).pushNamed(AppRoutes.categories);
    }
    return Container(
      height: 210,
      width: MediaQuery.of(context).size.width,
      color: Colors.lightBlue,
        padding: const EdgeInsets.all(10),
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(0),
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 0, bottom: 10),
            child: Text(
              context.l10n!.text_categories,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 5,),
          Center(
            child: SizedBox(
              height: 170,
              child: FutureBuilder<List<Categories>>(
                future: category.getCategories(),
                builder: (BuildContext context, snapshot) {
                  // debugPrint(snapshot.data.toString());
                  if(snapshot.hasData && snapshot.data != null) {
                    return ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data?.length ?? 0,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              routeCategories();
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10.0, right: 10),
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                                    child: CachedNetworkImage(
                                      imageUrl: snapshot.data![index].img.toString(),
                                      width: 104,
                                      height:120,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    snapshot.data![index].cat.toString(),
                                    style: const TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ),
                          );
                        });
                  }
                  return const Padding(
                    padding: EdgeInsets.only(top: 300.0),
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Colors.redAccent,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      )
    );
  }
}
