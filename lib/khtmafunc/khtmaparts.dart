import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:serapp/model/privatekhtma.dart';
import 'package:serapp/model/publickhtma.dart';
import 'package:serapp/theme/colors.dart';

class KhtmaParts extends StatelessWidget {
  KhtmaParts({super.key});
  late PublicKhtma publicKhtma;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: 400.w,
        height: 1600.h,
        decoration: BoxDecoration(gradient: maindecoration()),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image(image: AssetImage("assets/images/floraldesign.png")),
                  Text(
                    "ختمة",
                    style: TextStyle(fontSize: 30, fontFamily: "H-ALHFHAF"),
                  ),
                  Image(image: AssetImage("assets/images/floraldesign.png")),
                ],
              ),
              Stack(
                children: [
                  Container(
                    width: 309.w,
                    height: 151.h,
                    decoration: BoxDecoration(
                      color: Appcolor().sevencolor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text("", textAlign: TextAlign.center),
                    ),
                  ),

                  Positioned(
                    right: 3,
                    bottom: 90,
                    top: 3,
                    child: Image.asset(
                      "assets/images/note.png",
                      alignment: Alignment.topLeft,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Card(child: Text("1")),
                      Card(child: Text("2")),
                      Card(child: Text("3")),
                      Card(child: Text("4")),
                      Card(child: Text("5")),
                    ],
                  ),
                  Row(
                    children: [
                      Card(child: Text("6")),
                      Card(child: Text("7")),
                      Card(child: Text("8")),
                      Card(child: Text("9")),
                      Card(child: Text("10")),
                    ],
                  ),
                  Row(children: [

                  ],
                ),
                  Row(children: [

                  ],
                ),
                  Row(children: [

                  ],
                ),
                  Row(children: [

                  ],
                ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
