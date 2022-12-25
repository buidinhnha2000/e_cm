import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_cm/data/models/product/product.dart';
import 'package:e_cm/data/network/remote.dart';
import 'package:flutter/material.dart';
import '../../../app/navigator/router.dart';

final product = GetDataSource();
class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String searchQuery = '';
  final sizeIcon = const BoxConstraints(minWidth: 40, minHeight: 40);
  final border = const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.white54,
        width: 0,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(4.0),
      ));

  @override
  Widget build(BuildContext context) {
    routeDetail(Product products) {
      Navigator.of(context)
          .pushNamed(AppRoutes.productDetail, arguments: products);
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Container(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.only(right: 0, top: 10, bottom: 10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        searchQuery = value;
                      });
                    },
                    autofocus: true,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(top: 5, left: 20),
                      enabledBorder: border,
                      focusedBorder: border,
                      isDense: true,
                      hintText: "Searching",
                      hintStyle: const TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                      suffixIcon: const Icon(Icons.mic_none,
                          color: Colors.white70, size: 25),
                      suffixIconConstraints: sizeIcon,
                      filled: true,
                      fillColor: Colors.white10,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: FutureBuilder<List<Product>>(
            initialData: const [],
            future: product.getProduct(),
            builder: (BuildContext context, snapshot) {
              var listSearch = (snapshot.data ?? [])
                  .where((element) =>
                      element.title?.toLowerCase().contains(searchQuery) ??
                      false)
                  .toList();
              return ListView.builder(
                  itemCount: listSearch.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: (){
                        routeDetail(snapshot.data![index]);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: Container(
                          padding: const EdgeInsets.only(
                            left: 10,
                            top: 10,
                            bottom: 10,
                          ),
                          color: Colors.black45,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: SizedBox(
                                    height: 50,
                                    width: 70,
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5)),
                                      child: CachedNetworkImage(
                                        imageUrl: listSearch[index].img,
                                        fit: BoxFit.fill,
                                      ),
                                    )),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                flex: 5,
                                child: SizedBox(
                                  width: 250,
                                  child: Text(
                                    listSearch[index].title,
                                    style: const TextStyle(
                                        fontSize: 17,
                                        color: Colors.deepPurpleAccent),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            }),
      ),
    );
  }
}
