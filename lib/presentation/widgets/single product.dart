// import 'package:clickresturant/Core/constants/config.dart';
// import 'package:clickresturant/presentation/screens/product_detailes.dart';
// import 'package:clickresturant/presentation/screens/shopping_cart.dart';
// import 'package:flutter/material.dart';

// class SingleProduct extends StatelessWidget {
//   final String? proId;
//   final String? proName;
//   final String? proDec;
//   final String? proImg;
//   final double proPrice;

//   SingleProduct(
//       {required this.proId,
//       required this.proImg,
//       required this.proDec,
//       required this.proName,
//       required this.proPrice});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 2,
//       child: GestureDetector(
//         onTap: () {
//           Navigator.push(
//               context,
//               MaterialPageRoute(
//                   builder: (context) => ProductsDetail(
//                         proId: proId.toString(),
//                         proDec: proDec.toString(),
//                         proImg: proImg.toString(),
//                         proName: proName.toString(),
//                         price: proPrice.toDouble(),
//                       )));
//         },
//         child: Container(
//           padding: const EdgeInsets.all(5),
//           child: Column(
//             verticalDirection: VerticalDirection.down,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text(
//                 proName!,
//                 style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 16,
//                     color: primaryColor),
//               ),
//               Container(
//                 padding: const EdgeInsets.all(8),
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(12),
//                     image: DecorationImage(
//                         fit: BoxFit.cover, image: NetworkImage(proImg!))),
//                 child: SizedBox(
//                   width: MediaQuery.of(context).size.width,
//                   height: MediaQuery.of(context).size.height / 5,
//                 ),
//               ),
//               Row(
//                 children: [
//                   IconButton(
//                       onPressed: () {},
//                       icon: Icon(Icons.favorite, color: thirdColor)),
//                   IconButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => const Shopping()),
//                       );
//                     },
//                     icon: const Icon(
//                       Icons.shopping_cart,
//                     ),
//                   )
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
