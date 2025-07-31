import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:serapp/theme/colors.dart';

class CompitionScreen extends StatefulWidget {
  const CompitionScreen({super.key});

  @override
  State<CompitionScreen> createState() => _CompitionScreenState();
}

class _CompitionScreenState extends State<CompitionScreen> {
  final List<String> counterItems = ["41", "33", "77", "100", "1000", "مخصص"];
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: maindecoration()),
        ),
        leading: Icon(Icons.arrow_back_ios, color: Appcolor().sixcolor),
      ),
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
              SizedBox(
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
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        // الخلفية الملونة
                        Container(
                          height: 75.h,
                          width: 75.w,
                          decoration: BoxDecoration(
                            color: Appcolor().sevencolor,
                            shape: BoxShape.circle,
                          ),
                        ),

                        Image.asset(
                          "assets/images/frame.png",
                          height: 100.h,
                          width: 100.w,
                          fit: BoxFit.cover,
                        ),

                        Center(
                          child: Text(
                            counter.toString(),
                            style: TextStyle(
                              color: Appcolor().sixcolor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),

                    // Container(
                    //   height: 100.h,
                    //   width: 100.w,
                    //   decoration: BoxDecoration(
                    //     color: Appcolor().sevencolor,
                    //     image: DecorationImage(
                    //       image: AssetImage("assets/images/frame.png"),
                    //     ),
                    //   ),
                    //   child: Center(child: Text(counter.toString())),
                    // ),
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
                              children: List.generate(counterItems.length, (
                                index,
                              ) {
                                final angle =
                                    (2 * pi * index) / counterItems.length;
                                final radius = 140.0;

                                return Transform.translate(
                                  offset: Offset(
                                    radius * cos(angle),
                                    radius * sin(angle),
                                  ),
                                  child: Center(
                                    child: Text(
                                      counterItems[index],
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontFamily: "H-ALHFHAF",
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                );
                              }),
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
                            child: Center(
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    counter++;
                                  });
                                },
                                child: Text(
                                  "انقر",
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontFamily: "H-ALHFHAF",
                                  ),
                                ),
                              ),
                            ),
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
