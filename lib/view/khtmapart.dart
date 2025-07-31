import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:serapp/theme/colors.dart';

class KhtmaPartScreen extends StatefulWidget {
  final String niyyahvalue;
  KhtmaPartScreen({super.key, required this.niyyahvalue});

  @override
  State<KhtmaPartScreen> createState() => _KhtmaPartScreenState();
}

class _KhtmaPartScreenState extends State<KhtmaPartScreen> {
  List<bool> isCompleted = List.filled(30, false);
  void updateCard(int index) {
    setState(() {
      isCompleted[index] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: maindecoration()),
        ),
      ),

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
                    height: 63.h,
                    decoration: BoxDecoration(
                      color: Appcolor().sevencolor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        "النية: ${widget.niyyahvalue}",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),

                  Positioned(
                    right: 3,
                    bottom: 20,
                    top: 3,
                    child: Image.asset(
                      "assets/images/note.png",
                      alignment: Alignment.topLeft,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 350.w,
                  height: 500.h,
                  child: GridView.builder(
                    itemCount: 30,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 12,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => updateCard(index),
                        child: Container(
                          decoration: BoxDecoration(
                            color: isCompleted[index]
                                ? Appcolor().sevencolor
                                : Appcolor().cardcolor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              "${index + 1}",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
