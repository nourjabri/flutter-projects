import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:serapp/theme/colors.dart';

class PrivateKhtma extends StatefulWidget {
  const PrivateKhtma({super.key});

  @override
  State<PrivateKhtma> createState() => _PrivateKhtmaState();
}

class _PrivateKhtmaState extends State<PrivateKhtma> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                    "ختمة خاصة ",
                    style: TextStyle(fontSize: 30, fontFamily: "H-ALHFHAF"),
                  ),
                  Image(image: AssetImage("assets/images/floraldesign.png")),
                ],
              ),

              const SizedBox(height: 40),
              Container(
                width: 348.w,
                height: 500.h,
                color: Appcolor().sixcolor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
