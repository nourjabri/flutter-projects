import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:serapp/view/privatekhtma.dart';
import 'package:serapp/view/publickhtma.dart';
import 'package:serapp/theme/colors.dart';
import 'package:serapp/view/compition.dart';
import 'package:serapp/view/zikar.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  bool showExtraImagesTasbih = false;
  bool showExtraImagesKhatma = false;
  bool showExtraImagesSura = false;
  String? dropvalue;

  void toggleImagesTasbih() {
    setState(() {
      showExtraImagesTasbih = !showExtraImagesTasbih;
    });
  }

  void toggleImagesKhatma() {
    setState(() {
      showExtraImagesKhatma = !showExtraImagesKhatma;
    });
  }

  void toggleImagesSura() {
    setState(() {
      showExtraImagesKhatma = !showExtraImagesKhatma;
    });
  }

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
                    "سراج",
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
                      child: Text(
                        "المستخدم عند الفجر يعرض فقط\n الأوراد و الختم الفجرية ،\n و ما بقي من اليوم يعرض الأوراد و\n الختم الاخرى",
                        textAlign: TextAlign.center,
                      ),
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

              const SizedBox(height: 40),
              Container(
                width: 348.w,
                height: 500.h,
                color: Appcolor().sixcolor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: toggleImagesTasbih,
                          child: Container(
                            width: 80,
                            height: 80,
                            padding: EdgeInsets.only(top: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Appcolor().sevencolor,
                            ),
                            child: Column(
                              children: [
                                Center(
                                  child: SizedBox(
                                    width: 40,
                                    height: 40,
                                    child: Image.asset(
                                      "assets/images/tasbih.png",
                                    ),
                                  ),
                                ),
                                const Text(
                                  "تسبيح",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: "H-ALHFHAF",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        if (showExtraImagesTasbih) ...[
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Appcolor().sevencolor,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ZikarScreen(),
                                  ),
                                );
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Center(
                                    child: SizedBox(
                                      width: 30,
                                      height: 30,
                                      child: Image.asset(
                                        "assets/images/zikr.png",
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "جلسة ذكر",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: "H-ALHFHAF",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Appcolor().sevencolor,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CompitionScreen(),
                                  ),
                                );
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                    child: SizedBox(
                                      width: 30,
                                      height: 30,
                                      child: Image.asset(
                                        "assets/images/compitition.png",
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    "مسابقة ذكر",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: "H-ALHFHAF",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: toggleImagesKhatma,
                          child: Container(
                            padding: EdgeInsets.only(top: 8),
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Appcolor().sevencolor,
                            ),
                            child: Column(
                              children: [
                                Center(
                                  child: SizedBox(
                                    width: 40,
                                    height: 40,
                                    child: Image.asset(
                                      "assets/images/khatma.png",
                                    ),
                                  ),
                                ),
                                const Text(
                                  "ختمة",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: "H-ALHFHAF",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        if (showExtraImagesKhatma) ...[
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Appcolor().sevencolor,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PrivateKhtma(),
                                  ),
                                );
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Center(
                                      child: SizedBox(
                                        width: 30,
                                        height: 30,
                                        child: Image.asset(
                                          "assets/images/private.png",
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    "ختمة خاصة",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: "H-ALHFHAF",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Appcolor().sevencolor,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        Publickhtma(type: 'public'),
                                  ),
                                );
                              },
                              child: Column(
                                children: [
                                  Center(
                                    child: SizedBox(
                                      width: 30,
                                      height: 30,
                                      child: Image.asset(
                                        "assets/images/public.png",
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    "ختمة عامة",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: "H-ALHFHAF",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
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
