import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:serapp/theme/colors.dart';

class KhtmaParts extends StatefulWidget {
  const KhtmaParts({super.key});

  @override
  State<KhtmaParts> createState() => _KhtmaPartsState();
}

class _KhtmaPartsState extends State<KhtmaParts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("test", style: TextStyle(color: Colors.black)),
      ),

      // body: Container(
      //   width: 500.w,
      //   height: 1200.h,
      //   decoration: BoxDecoration(gradient: maindecoration()),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: [
      //       const Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceAround,
      //         children: [
      //           Image(image: AssetImage("assets/images/floraldesign.png")),
      //           Text(
      //             "ختمة ",
      //             style: TextStyle(fontSize: 30, fontFamily: "H-ALHFHAF"),
      //           ),
      //           Image(image: AssetImage("assets/images/floraldesign.png")),
      //         ],
      //       ),

      // Container(
      //   width: 311.w,
      //   height: 66.h,
      //   color: Appcolor().sixcolor,
      //   child: Stack(
      //     children: [
      //       Container(
      //         width: 309.w,
      //         height: 151.h,
      //         decoration: BoxDecoration(
      //           color: Appcolor().sevencolor,
      //           borderRadius: BorderRadius.circular(8),
      //         ),
      //         child: const Center(
      //           child: Text("نية الختمة", textAlign: TextAlign.center),
      //         ),
      //       ),

      //       Positioned(
      //         right: 3,
      //         bottom: 90,
      //         top: 3,
      //         child: Image.asset(
      //           "assets/images/note.png",
      //           alignment: Alignment.topLeft,
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      // Container(
      //   child: Column(
      //     children: [
      //       Card(color: Appcolor().sevencolor, child: Text("1")),
      //       Card(color: Appcolor().sevencolor, child: Text("2")),
      //       Card(color: Appcolor().sevencolor, child: Text("3")),
      //       Card(color: Appcolor().sevencolor, child: Text("4")),
      //       Card(color: Appcolor().sevencolor, child: Text("5")),
      //       Card(color: Appcolor().sevencolor, child: Text("6")),
      //       Card(color: Appcolor().sevencolor, child: Text("7")),
      //       Card(color: Appcolor().sevencolor, child: Text("8")),
      //       Card(color: Appcolor().sevencolor, child: Text("9")),
      //       Card(color: Appcolor().sevencolor, child: Text("10")),
      //       Card(color: Appcolor().sevencolor, child: Text("11")),
      //       Card(color: Appcolor().sevencolor, child: Text("12")),
      //       Card(color: Appcolor().sevencolor, child: Text("13")),
      //       Card(color: Appcolor().sevencolor, child: Text("14")),
      //       Card(color: Appcolor().sevencolor, child: Text("15")),
      //       Card(color: Appcolor().sevencolor, child: Text("16")),
      //       Card(color: Appcolor().sevencolor, child: Text("17")),
      //       Card(color: Appcolor().sevencolor, child: Text("18")),
      //       Card(color: Appcolor().sevencolor, child: Text("19")),
      //       Card(color: Appcolor().sevencolor, child: Text("20")),
      //       Card(color: Appcolor().sevencolor, child: Text("21")),
      //       Card(color: Appcolor().sevencolor, child: Text("22")),
      //       Card(color: Appcolor().sevencolor, child: Text("23")),
      //       Card(color: Appcolor().sevencolor, child: Text("24")),
      //       Card(color: Appcolor().sevencolor, child: Text("25")),
      //       Card(color: Appcolor().sevencolor, child: Text("26")),
      //       Card(color: Appcolor().sevencolor, child: Text("27")),
      //       Card(color: Appcolor().sevencolor, child: Text("28")),
      //       Card(color: Appcolor().sevencolor, child: Text("29")),
      //       Card(color: Appcolor().sevencolor, child: Text("30")),
      //     ],
      //   ),
      // ),
      //     ],
      //   ),
      // ),
    );
  }
}
