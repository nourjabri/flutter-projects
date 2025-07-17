import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'color.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  bool showExtraImagesTasbih = false;
  bool showExtraImagesKhatma = false;

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
              child: Center(
                child: Text(
                  "المستخدم عند الفجر يعرض فقط\n الأوراد و الختم الفجرية ،\n و ما بقي من اليوم يعرض الأوراد و\n الختم الاخرى",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 40),
            Container(
              width: 348.w,
              height: 150.h,
              color: Appcolor().sixcolor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: toggleImagesTasbih,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
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
                                    )),
                              ),
                              Text("تسبيح"),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      if (showExtraImagesTasbih) ...[
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Appcolor().sevencolor,
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                  width: 50,
                                  height: 50,
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
                                  width: 50,
                                  height: 50,
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
                        onTap: toggleImagesKhatma,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Appcolor().sevencolor,
                          ),
                          child: Column(
                            children: [
                              Center(
                                child: SizedBox(
                                    width: 40,
                                    height: 40,
                                    child: Image.asset(
                                        "assets/images/khatma.png")),
                              ),
                              Text("ختمة"),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      if (showExtraImagesKhatma) ...[
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Appcolor().sevencolor,
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                  width: 50,
                                  height: 50,
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
                                  width: 50,
                                  height: 50,
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
        backgroundColor: Appcolor().sixcolor,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            backgroundColor: Appcolor().sixcolor,
            builder: (context) {
              return Container(
                width: 400.w,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          hintText: "النية",
                          hintStyle: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: "بداية الختمة",
                          hintStyle: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: "نهاية الختمة",
                          hintStyle: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("إضافة"),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Icon(
          Icons.add,
          color: Appcolor().sevencolor,
        ),
      ),
    );
  }
}
