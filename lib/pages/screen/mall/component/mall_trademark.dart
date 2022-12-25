import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_cm/data/network/remote.dart';
import 'package:e_cm/l10n/l10n.dart';
import 'package:flutter/material.dart';

final movies = GetDataSource();

class MallTrademark extends StatelessWidget {
  const MallTrademark({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black45,
        height: 500,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    context.l10n!.text_trademark_hot,
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Row(
                        children: const [
                          Text(
                            "More",
                            style:
                            TextStyle(color: Colors.white70, fontSize: 16),
                          ),
                          Icon(
                            Icons.navigate_next_rounded,
                            color: Colors.white70,
                          )
                        ],
                      )),
                ],
              ),
            ),
            Container(
              height: 110,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/banner1.jpg'),
                      fit: BoxFit.fill)),
            ),
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                height: 320,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                child: FutureBuilder(
                  future: movies.getMovie(),
                  builder: (context, snapshot) {
                    if(snapshot.hasData && snapshot.data != null){
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data?.length ?? 0,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            child: Container(
                              width: 150,
                              padding: const EdgeInsets.only(
                                  left: 10, top: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                                    child: CachedNetworkImage(
                                      imageUrl: snapshot.data![index].img,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    height: 40,
                                    child: Text(
                                      snapshot.data![index].name,
                                      style:
                                      const TextStyle(color: Colors.white60),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    snapshot.data![index].year,
                                    style: const TextStyle(color: Colors.red),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        "Da ban",
                                        style: TextStyle(color: Colors.white60),
                                      ),
                                      const SizedBox(
                                        width: 3,
                                      ),
                                      Text(
                                        snapshot.data![index].top,
                                        style: const TextStyle(
                                            color: Colors.white60),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.redAccent,
                      ),
                    );
                  },
                )),
          ],
        ));
  }
}
