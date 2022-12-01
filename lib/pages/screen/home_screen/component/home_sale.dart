import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_cm/data/network/remote.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/movie/movie.dart';


final movies = GetDataSource();
class HomeSale extends StatefulWidget {
  const HomeSale({Key? key}) : super(key: key);

  @override
  State<HomeSale> createState() => _HomeSaleState();
}
class _HomeSaleState extends State<HomeSale> {
  @override
  Widget build(BuildContext context) {
    return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.pink[50]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 15,
                      ),
                      child: Text(
                        "DONG GIA 0 USD",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Row(
                          children: const [
                            Text(
                              "Xem them",
                              style: TextStyle(color: Colors.red, fontSize: 16),
                            ),
                            Icon(
                              Icons.navigate_next_rounded,
                              color: Colors.red,
                            )
                          ],
                        )),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.blueGrey[900]),
                      height: 190,
                      width: MediaQuery.of(context).size.width,
                      child: FutureBuilder<List<Movie>>(
                        future: movies.getMovie(),
                        builder: (BuildContext context, snapshot) {
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {},
                                child: Container(
                                  padding: const EdgeInsets.only(left: 10, top: 10,),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 150,
                                        width: 100,
                                        child: CachedNetworkImage(
                                          imageUrl: snapshot.data![index].img,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        snapshot.data![index].quality,
                                        style:
                                            const TextStyle(color: Colors.pink),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      )),
                ),
              ],
            )
    );
  }
}