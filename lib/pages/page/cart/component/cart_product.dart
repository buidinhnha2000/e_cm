import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_cm/data/network/remote.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/movie/movie.dart';

final movies = GetDataSource();

class CartProduct extends StatefulWidget {
  const CartProduct({Key? key}) : super(key: key);

  @override
  State<CartProduct> createState() => _CartProductState();
}

class _CartProductState extends State<CartProduct> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

    return FutureBuilder<List<Movie>>(future: movies.getMovie(), builder: (BuildContext context, snapshot) {
      if(snapshot.hasData && snapshot.data != null){
        return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: snapshot.data?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.black54,
                    ),
                    padding: const EdgeInsets.only(
                      right: 10,
                      top: 5,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Checkbox(
                            checkColor: Colors.white,
                            fillColor: MaterialStateProperty.resolveWith(getColor),
                            value: isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value!;
                              });
                            },
                          ),
                        ),
                        Expanded(
                            flex: 2,
                            child: SizedBox(
                              height: 80,
                              width: MediaQuery.of(context).size.width,
                              child: ClipRRect(
                                borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                                child: CachedNetworkImage(
                                  imageUrl: snapshot.data![index].img,
                                  fit: BoxFit.fill,
                                ),
                              ),)),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            flex: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(snapshot.data![index].name,
                                      style: const TextStyle(
                                          color: Colors.white54, fontSize: 15)),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    snapshot.data![index].year,
                                    style: const TextStyle(
                                        color: Colors.deepOrange, fontSize: 20),
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.remove,
                                            color: Colors.white54,
                                          )),
                                      Text(snapshot.data![index].top,
                                          style: const TextStyle(
                                              color: Colors.white54, fontSize: 15)),
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.add,
                                            color: Colors.white54,
                                          ))
                                    ],
                                  )
                                ],
                              ),
                            )),
                        Expanded(
                            flex: 1,
                            child: IconButton(onPressed: (){}, icon: const Icon(Icons.delete_forever, size: 30, color: Colors.deepOrange,))
                        ),
                      ],
                    ),
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
    });
  }
}
