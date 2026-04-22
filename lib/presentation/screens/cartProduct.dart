// import 'package:clickresturant/Core/constants/config.dart';
// import 'package:clickresturant/logic/bloc/cartBloc/cart_bloc.dart';
// import 'package:clickresturant/logic/bloc/productBloc/products_bloc.dart';
// import 'package:clickresturant/presentation/screens/shopping_cart.dart';
// import 'package:clickresturant/presentation/widgets/cartBar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class Cartproduct extends StatelessWidget {
//   const Cartproduct({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         actions: [
//           IconButton(
//               onPressed: () {}, icon: Icon(Icons.favorite, color: thirdColor)),
//           IconButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => const Shopping()),
//               );
//             },
//             icon: const Icon(
//               Icons.shopping_cart,
//             ),
//           )
//         ],
//         title: Text(
//           "product details",
//           style: const TextStyle(
//               fontSize: 20, color: fourColor, fontWeight: FontWeight.bold),
//         ),
//         elevation: 0.0,
//         leading: IconButton(
//           onPressed: () => Navigator.pop(context),
//           icon: const Icon(Icons.arrow_back_ios),
//           color: Colors.black,
//         ),
//         foregroundColor: fourColor,
//         backgroundColor: Colors.white,
//       ),
//       body: Column(
//         children: [
//           Center(
//             child: BlocConsumer<ProductsBloc, ProductsState>(builder: (
//               context,
//               state,
//             ) {
//               if (state is Productsloaded) {
//                 return Expanded(
//                   child: ListView.builder(
//                     itemCount: state.products.length,
//                     itemBuilder: (context, index) => Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         children: [
//                           ClipRRect(
//                             borderRadius: BorderRadius.circular(16),
//                             child: Image.network(
//                               state.products[index].proImage,
//                               height: 240,
//                               width: double.infinity,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                           const SizedBox(height: 20),
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text(
//                               state.products[index].proDec,
//                               style: const TextStyle(
//                                   fontSize: 16, color: Colors.grey),
//                             ),
//                           ),
//                           const SizedBox(height: 20),
//                           Center(
//                             child: Text(
//                               " Price is : ${state.products[index].proPrice.toStringAsFixed(2)}\$",
//                               style: const TextStyle(
//                                 fontSize: 24,
//                                 fontWeight: FontWeight.bold,
//                                 color: thirdColor,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               } else {
//                 return const Center(
//                   child: Text("Check Your connection please "),
//                 );
//               }
//             }, listener: (context, state) {
//               if (state is Productsloaded) {}
//             }),
//           )
//         ],
//       ),
//     );
//   }
// }
