import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'color.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  bool showExtraImages = false;
  void toggleImages() {
    setState(() {
      showExtraImages = !showExtraImages;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Appcolor().firstcolor,
              Appcolor().secondcolor,
              Appcolor().thirdcolor,
              Appcolor().forthcolor,
              Appcolor().fivstcolor,
              Appcolor().sixcolor,
            ],
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(image: AssetImage("assets/images/floraldesign.png")),
                Text("سراج"),
                Image(image: AssetImage("assets/images/floraldesign.png")),
              ],
            ),
            Container(
              width: 309.w,
              height: 151.h,
              decoration: BoxDecoration(
                  color: Appcolor().sevencolor,
                  borderRadius: BorderRadius.circular(8)),
              child: Text(
                "المستخدم عند الفجر يعرض فقط\n الأوراد و الختم الفجرية ،\n و ما بقي من اليوم يعرض الأوراد و\n الختم الاخرى",
              ),
            ),
            SizedBox(height: 40),
            Container(
              width: 348.w,
              height: 122.h,
              color: Appcolor().sixcolor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: toggleImages,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Appcolor().sevencolor,
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: Image.asset(
                                    "assets/images/tasbih.png",
                                  )),
                              Text("تسبيح"),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      if (showExtraImages) ...[
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Appcolor().sevencolor,
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: Image.asset("assets/images/zikr.png")),
                              Text("جلسة ذكر"),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Appcolor().sevencolor,
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: Image.asset(
                                      "assets/images/compitition.png")),
                              Text("مسابقة ذكر"),
                            ],
                          ),
                        ),
                      ],
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: toggleImages,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Appcolor().sevencolor,
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: Image.asset("assets/images/sura.png")),
                              Text("سورة"),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      if (showExtraImages) ...[
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Appcolor().sevencolor,
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                  width: 30,
                                  height: 30,
                                  child:
                                      Image.asset("assets/images/private.png")),
                              Text("ختمة خاصة"),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Appcolor().sevencolor,
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                  width: 30,
                                  height: 30,
                                  child:
                                      Image.asset("assets/images/public.png")),
                              Text("ختمة عامة"),
                            ],
                          ),
                        ),
                      ],
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: toggleImages,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Appcolor().sevencolor,
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                  width: 30,
                                  height: 30,
                                  child:
                                      Image.asset("assets/images/khatma.png")),
                              Text("ختمة"),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      if (showExtraImages) ...[
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Appcolor().sevencolor,
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                  width: 30,
                                  height: 30,
                                  child:
                                      Image.asset("assets/images/private.png")),
                              Text("ختمة خاصة"),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Appcolor().sevencolor,
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                  width: 30,
                                  height: 30,
                                  child:
                                      Image.asset("assets/images/public.png")),
                              Text("ختمة عامة"),
                            ],
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showBottomSheet(context: context, builder: (context) => Text("data"));
        },
        child: Icon(
          Icons.add,
          color: Appcolor().sevencolor,
        ),
      ),
    );
  }
}
