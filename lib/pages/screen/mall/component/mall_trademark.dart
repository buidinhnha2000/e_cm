import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_cm/data/network/remote.dart';
import 'package:flutter/material.dart';

final movies = GetDataSource();

class MallTrademark extends StatelessWidget {
  const MallTrademark({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        color: Colors.black45,
        height: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Trademark Hot",
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Row(
                        children: const [
                          Text(
                            "Xem them",
                            style: TextStyle(
                                color: Colors.white70, fontSize: 16),
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
              height: 90,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/banner1.jpg'
                      ), fit: BoxFit.fill)
              ),
            ),
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                height: 260,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                child: FutureBuilder(
                  future: movies.getMovie(), builder: (context, snapshot) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        child: Container(
                          width: 150,
                          padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 150,
                                width: size.width,
                                child: CachedNetworkImage(
                                    imageUrl: snapshot.data![index].img,
                                fit: BoxFit.fill),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                height: 40,
                                child: Text(
                                  snapshot.data![index].name,
                                  style: const TextStyle(color: Colors.white60),
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
                                  Text("Da ban",
                                    style: TextStyle(color: Colors.white60),),
                                  SizedBox(width: 3,),
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
                },)
            ),
          ],
        ));
  }
}