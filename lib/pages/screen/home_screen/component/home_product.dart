import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_cm/data/models/movie/movie.dart';
import 'package:e_cm/data/network/remote.dart';
import 'package:flutter/material.dart';

final movies = GetDataSource();

class HomeProduct extends StatelessWidget {
  const HomeProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(0),
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 5, bottom: 10),
              child: Text(
                "SAN PHAM NOI BAT",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ),
            FutureBuilder<List<Movie>>(
                future: movies.getMovie(),
                builder: (BuildContext context, snapshot) {
                  return GridView.builder(
                    padding: const EdgeInsets.all(0),
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                    const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        mainAxisExtent: 250,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, index) {
                      return GestureDetector(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 200,
                              width: size.width,
                              child: CachedNetworkImage(
                                imageUrl: snapshot.data![index].img,
                                fit: BoxFit.fill,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              snapshot.data![index].episodetotal,
                              style: const TextStyle(color: Colors.white),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  snapshot.data![index].year,
                                  style: const TextStyle(color: Colors.red),
                                ),
                                Text(
                                  "Da ban ${snapshot.data![index]
                                      .episodetotal}",
                                  style: const TextStyle(color: Colors.white54),
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  );
                }),
          ],
        ));

  }
}
