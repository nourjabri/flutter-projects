import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:serapp/khtmafunc/khtmafunctions.dart';
import 'package:serapp/theme/colors.dart';

class Publickhtma extends StatefulWidget {
  final String type;
  Publickhtma({super.key, required this.type});

  @override
  State<Publickhtma> createState() => _PublickhtmaState();
}

class _PublickhtmaState extends State<Publickhtma> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.type == 'public' ? 'ختمة عامة' : 'ختمة خاصة',
          style: TextStyle(fontSize: 30, fontFamily: "H-ALHFHAF"),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(gradient: maindecoration()),
        child: Center(
          child: Expanded(
            child: SizedBox(
              // height: 220.h,
              width: 350.w,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) => Column(
                  children: [
                    Container(
                      width: 309.w,
                      height: 195.h,
                      decoration: BoxDecoration(
                        color: Appcolor().sevencolor,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withValues(alpha: 0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "ختمة بنية الشفاء",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: "H-ALHFHAF",
                                  ),
                                ),

                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    SizedBox(
                                      height: 100,
                                      width: 100,
                                      child: Image.asset(
                                        "assets/images/note.png",
                                        width: double.infinity,
                                        // fit: BoxFit.cover,
                                      ),
                                    ),
                                    Text(
                                      '1',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        backgroundColor: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Divider(),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "تاريخ البدء",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "H-ALHFHAF",
                                ),
                              ),
                              SizedBox(
                                width: 50,
                                height: 30,
                                child: Image.asset(
                                  "assets/images/flora.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                "تاريخ الانتهاء",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "H-ALHFHAF",
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [Text("22/3/2024"), Text("22/3/2024")],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 150),
        child: khtmasheet(context),
      ),
    );
  }
}
