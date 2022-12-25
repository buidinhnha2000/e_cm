// import 'package:flutter/material.dart';
//
// class ProductDetailOtherProduct extends StatefulWidget {
//   const ProductDetailOtherProduct({Key? key}) : super(key: key);
//
//   @override
//   State<ProductDetailOtherProduct> createState() =>
//       _ProductDetailOtherProductState();
// }
//
// class _ProductDetailOtherProductState extends State<ProductDetailOtherProduct> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         color: Colors.black45,
//         height: 320,
//         padding: EdgeInsets.only(left: 10, top: 10),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "San pham khac cua Shop",
//                   style: TextStyle(
//                       color: Colors.white70,
//                       fontSize: 20,
//                       fontWeight: FontWeight.w500),
//                 ),
//                 TextButton(
//                     onPressed: () {},
//                     child: Row(
//                       children: const [
//                         Text(
//                           "Xem them",
//                           style: TextStyle(color: Colors.red, fontSize: 16),
//                         ),
//                         Icon(
//                           Icons.navigate_next_rounded,
//                           color: Colors.red,
//                         )
//                       ],
//                     )),
//               ],
//             ),
//             Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(5),
//               ),
//               height: 260,
//               width: MediaQuery.of(context).size.width,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: listProduct.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return GestureDetector(
//                     child: Container(
//                       width: 130,
//                       padding: const EdgeInsets.all(10),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             height: 150,
//                             decoration: BoxDecoration(
//                                 image: DecorationImage(
//                                     image: AssetImage(listProduct[index].img),
//                                     fit: BoxFit.fill),
//                                 borderRadius: BorderRadius.circular(4)),
//                           ),
//                           const SizedBox(
//                             height: 5,
//                           ),
//                           Container(
//                             height: 40,
//                             child: Text(
//                               listProduct[index].name,
//                               style: const TextStyle(color: Colors.white60),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 5,
//                           ),
//                           Text(
//                             listProduct[index].gia,
//                             style: const TextStyle(color: Colors.red),
//                           ),
//                           const SizedBox(
//                             height: 5,
//                           ),
//                           Row(
//                             children: [
//                               Text("Da ban", style: TextStyle(color: Colors.white60),),
//                               SizedBox(width: 3,),
//                               Text(
//                                 listProduct[index].soluong,
//                                 style: const TextStyle(color: Colors.white60),
//                               )
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ));
//   }
// }