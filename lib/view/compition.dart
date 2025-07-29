import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:serapp/theme/colors.dart';

class CompitionScreen extends StatefulWidget {
  const CompitionScreen({super.key});

  @override
  State<CompitionScreen> createState() => _CompitionScreenState();
}

class _CompitionScreenState extends State<CompitionScreen> {
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
                    " سراج",
                    style: TextStyle(fontSize: 30, fontFamily: "H-ALHFHAF"),
                  ),
                  Image(image: AssetImage("assets/images/floraldesign.png")),
                ],
              ),

              const SizedBox(height: 40),
              Container(
                width: 348.w,
                height: 800.h,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 350.w,
                      height: 150.h,
                      decoration: BoxDecoration(
                        color: Appcolor().sixcolor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          "سبحان الله و بحمده \nسبحان الله العظيم  ",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 100.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                        color: Appcolor().sevencolor,
                        image: DecorationImage(
                          image: AssetImage("assets/images/frame.png"),
                        ),
                      ),
                      child: Center(child: Text("data")),
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 700,
                          height: 400,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Appcolor().sevencolor,
                          ),
                          child: Transform.rotate(
                            angle: 30,
                            child: Stack(
                              children: [
                                Text("41"),
                                Text("33"),
                                Text("100"),
                                Text("1000"),
                                Text("7"),

                                
                                Text("10"),
                                Text("مخصص"),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 400,
                          height: 250,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xffB994706B),
                          ),
                        ),
                        Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage("assets/images/mandala.png"),
                            ),
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Appcolor().sevencolor,
                            image: DecorationImage(
                              image: AssetImage("assets/images/tap.png"),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 50),
                            child: Center(child: Text("انقر")),
                          ),
                        ),
                      ],
                    ),
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
