import 'dart:async';
import 'package:audioapp/mainbuttons/colors.dart';
import 'package:audioapp/service/service.dart';
import 'package:audioapp/view/correction.dart';
import 'package:audioapp/view/historyaudio.dart';
import 'package:audioapp/view/recdoringfunc.dart';
import 'package:audioapp/view/restpassword.dart';
import 'package:audioapp/view/tasmeahwidth.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AlhadithScreen extends StatefulWidget {
  const AlhadithScreen({super.key});

  @override
  State<AlhadithScreen> createState() => _AlhadithScreenState();
}

class _AlhadithScreenState extends State<AlhadithScreen> {
  int currentIndex = 0;
  bool isRecording = false;
  bool isPlaying = false;
  bool hadithPlaying = false;
  String transcript = "النص المفرغ من الصوت";
  String reference = "النص المرجعي للحفظ";
  String corrected = "";
  double percent = 0;
  String? recordedFilePath;
  String? transcribtext;
  String hadithId = "";
  TextEditingController hadithController = TextEditingController();
  final AudioPlayer hadithAudio = AudioPlayer();
  bool isPressed = false;

  @override
  void dispose() {
    hadithAudio.dispose();
    super.dispose();
  }

  Future<void> playPauseHadith() async {
    if (hadithPlaying) {
      await hadithAudio.pause();
    } else {
      await hadithAudio.play(AssetSource("audios/ahdith1.mp3"));
    }
    setState(() {
      hadithPlaying = !hadithPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // actions: [
        //   IconButton(
        //       onPressed: () {},
        //       icon: Icon(
        //         Icons.person,
        //         color: Colors.white,
        //       )),
        // ],
        title: Text(
          "حديث النيات",
          style: TextStyle(
              fontFamily: "Cairo",
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
        backgroundColor: Appcolor().secondrcolor,
        centerTitle: true,
      ),
      endDrawer: Drawer(
        child: Column(
          spacing: 2,
          children: [
            Container(
              height: 270,
              color: Appcolor().primarycolor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 50, bottom: 5, top: 20),
                    child: Icon(
                      Icons.person_outline_sharp,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 50, bottom: 5, top: 20),
                    child: Text(
                      "user.name",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Cario",
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 50, bottom: 10, top: 20),
                    child: Text(
                      "+936 95-1246456",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Cario",
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/fearther.png",
                        width: 28,
                      ),
                      Text(
                        "150",
                        style: TextStyle(color: Colors.white),
                      ),
                      VerticalDivider(
                        color: Colors.white,
                        thickness: 20,
                        width: 50,
                      ),
                      Image.asset(
                        "assets/images/headphones.png",
                        width: 28,
                      ),
                      Text(
                        "80",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "الإشعارات",
                    style: TextStyle(
                        color: Colors.grey,
                        fontFamily: "Cario",
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.notifications,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Tasmeahwidth()));
                    },
                    child: Text(
                      "باقات التسميع",
                      style: TextStyle(
                          color: Colors.grey,
                          fontFamily: "Cario",
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.headphones,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HistoryAudios()));
                    },
                    child: Text(
                      "التسجيلات السابقة",
                      style: TextStyle(
                          color: Colors.grey,
                          fontFamily: "Cario",
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.history,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Restpassword()));
                    },
                    child: Text(
                      "إعادة تعيين كلمة المرور",
                      style: TextStyle(
                          color: Colors.grey,
                          fontFamily: "Cario",
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.key,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "تسجيل الخروج",
                    style: TextStyle(
                        color: Colors.grey,
                        fontFamily: "Cario",
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.logout,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Card(
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/fearther.png",
                      width: 20,
                      height: 20,
                    ),
                    Text("150"),
                  ],
                ),
              ),
              Row(
                children: [
                  Text("!سمع الحديث النبوي"),
                  IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                              insetPadding: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 100),
                              title: Center(
                                child: Text(
                                  " تنويه",
                                  style: TextStyle(
                                    fontFamily: "Cairo",
                                    color: Appcolor().secondrcolor,
                                  ),
                                ),
                              ),
                              content: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Text(
                                        "قد يرد في هذا الحديث مفردات \nلها عدّة قراءات \n  يرجى الاستماع للحديث",
                                        style: TextStyle(
                                          fontFamily: "Cairo",
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    Divider(),
                                    TextButton(
                                        onPressed: () async {
                                          await playPauseHadith();
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          "استماع",
                                          style: TextStyle(
                                              fontFamily: "Cairo",
                                              color: Colors.black),
                                        )),
                                  ])),
                        );
                      },
                      icon: Icon(Icons.error)),
                ],
              ),
            ],
          ),
          Container(
            width: 360,
            height: 60,
            color: Colors.white,
            margin: EdgeInsets.all(12),
            child: Center(
              child: Text(
                "عَنْ أَمِيرِ المُؤمِنينَ أَبي حَفْصٍ عُمَرَ بْنِ الخَطَّابِ",
                style: TextStyle(
                    color: Color(0xff61933E),
                    fontSize: 18,
                    fontFamily: "Cairo",
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
          Container(
            width: 360,
            height: 324,
            color: Colors.white,
            margin: EdgeInsets.all(8),
            child: Center(
              child: isRecording
                  ? Text(
                      "جارٍ التسجيل...",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    )
                  : transcribtext != null
                      ? TextField(
                          controller: hadithController..text = transcribtext!,
                          maxLines: null,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        )
                      : Text(
                          "قَالَ : سَمِعْتُ رَسُولَ اللهِ ﷺ يَقُولُ : "
                          " إِنَّمَا\n الأَعْمَالُ بِالنِّيَّاتِ ، وَإنَّمَا لِكُلِّ امْرِىءٍ مَا نَوَى ، فَمَنْ \nكَانَتْ هِجْرَتُهُ إِلى اللهِ وَرَسُوله فَهِجْرتُهُ إلى اللهِ  \n وَرَسُوُله ، وَمَنْ كَانَتْ هِجْرَتُهُ لِدُنْيَا يُصِيْبُهَا  أو مرأة\n ينكحها فهجرته إلى ما هاجر إليه",
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: "Cairo",
                              fontWeight: FontWeight.w400),
                        ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 120),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(160, 40),
                backgroundColor:
                    isPressed ? Appcolor().primarycolor : Colors.grey,
              ),
              onPressed: () {
                double similarity =
                    compareTranscriptWithReference(transcribtext!, hadithId);

                setState(() {
                  percent = similarity ?? 0.0;
                  isPressed = true;
                });
              },
              child: Text(
                "عرض النتيجة",
                style: TextStyle(fontFamily: "Cairo", color: Colors.white),
              ),
            ),
          ),
          if (transcribtext != null)
            Text(
              "نسبة التطابق: ${percent.toStringAsFixed(2)}%",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
        ],
      ),
      bottomNavigationBar: HadithbootmeBar(context),
      bottomSheet: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                  Color(0xff088395),
                  Color(0xffFFFFFF),
                  // Color(0xff9FCAD7)
                ],
                end: Alignment.bottomCenter)),
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                  playAudio(recordedFilePath);
                },
                icon: Icon(isPlaying ? Icons.stop : Icons.play_arrow)),
          ],
        ),
      ),
    );
  }

  NavigationBar HadithbootmeBar(BuildContext context) {
    return NavigationBar(
      backgroundColor: Appcolor().secondrcolor,
      selectedIndex: currentIndex,
      onDestinationSelected: (value) async {
        if (value == 1) {
          await playPauseHadith();
        }

        if (value == 2) {
          if (!isRecording) {
            final path = await startRecording();
            setState(() {
              recordedFilePath = path;
              isRecording = true;
            });
          } else {
            await stopRecording();
            if (recordedFilePath != null) {
              final text = await uploadAndTranscribe(recordedFilePath!);
              double? similarity =
                  await compareTranscriptWithJsonId(reference, hadithId);
              if (similarity != null) {
                print("نسبة التطابق: ${similarity.toStringAsFixed(2)}%");
              } else {
                print("لم يتم العثور على الحديث بالـ ID المطلوب");
              }
              setState(() {
                isRecording = false;
                transcribtext = text;
              });
            } else {
              setState(() {
                isRecording = false;
              });
            }
          }
        }

        setState(() {
          currentIndex = value;
        });
      },
      destinations: [
        NavigationDestination(
          icon: Icon(Icons.arrow_back_ios),
          label: "السابق",
        ),
        NavigationDestination(
          icon: Icon(Icons.headphones),
          label: "استماع",
        ),
        NavigationDestination(
          icon: Tooltip(
            message: isRecording ? 'أوقف التسجيل' : 'سمع الحديث',
            child: Icon(isRecording ? Icons.stop : Icons.mic),
          ),
          label: isRecording ? "إيقاف" : "تسميع",
        ),
        NavigationDestination(
          icon: Icon(Icons.arrow_forward_ios),
          label: "التالي",
        ),
      ],
    );
  }
}
