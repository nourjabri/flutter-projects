// Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         GestureDetector(
//                           onTap: toggleImagesSura,
//                           child: Container(
//                             padding: EdgeInsets.only(top: 8),
//                             width: 80,
//                             height: 80,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(40),
//                               color: Appcolor().sevencolor,
//                             ),
//                             child: Column(
//                               children: [
//                                 Center(
//                                   child: SizedBox(
//                                     width: 40,
//                                     height: 40,
//                                     child: Image.asset(
//                                       "assets/images/sura.png",
//                                     ),
//                                   ),
//                                 ),
//                                 const Text(
//                                   "سورة",
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                     fontSize: 20,
//                                     fontFamily: "H-ALHFHAF",
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 20),
//                         if (showExtraImagesSura) ...[
//                           Container(
//                             width: 80,
//                             height: 80,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(40),
//                               color: Appcolor().sevencolor,
//                             ),
//                             child: GestureDetector(
//                               onTap: () {},
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Center(
//                                     child: Center(
//                                       child: SizedBox(
//                                         width: 30,
//                                         height: 30,
//                                         child: Image.asset(
//                                           "assets/images/private.png",
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   const Text(
//                                     "ختمة خاصة",
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                       fontSize: 15,
//                                       fontFamily: "H-ALHFHAF",
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 10),
//                           Container(
//                             width: 80,
//                             height: 80,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(50),
//                               color: Appcolor().sevencolor,
//                             ),
//                             child: GestureDetector(
//                               onTap: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => PrivateKhtma(),
//                                   ),
//                                 );
//                               },
//                               child: Column(
//                                 children: [
//                                   Center(
//                                     child: SizedBox(
//                                       width: 30,
//                                       height: 30,
//                                       child: Image.asset(
//                                         "assets/images/public.png",
//                                       ),
//                                     ),
//                                   ),
//                                   const Text(
//                                     "ختمة عامة",
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                       fontSize: 15,
//                                       fontFamily: "H-ALHFHAF",
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ],
//                     ),