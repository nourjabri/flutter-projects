import 'dart:async';
import 'dart:io';
import 'package:audioapp/mainbuttons/colors.dart';
import 'package:audioapp/view/recordAudio.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:just_waveform/just_waveform.dart';

class Alhadith extends StatefulWidget {
  const Alhadith({super.key});

  @override
  State<Alhadith> createState() => _AlhadithState();
}

class _AlhadithState extends State<Alhadith> {
  int currentIndex = 0;

  final AudioPlayer hadithAudio = AudioPlayer();
  bool hadithPlaying = false;
  @override
  Future<void> playpused() async {
    if (hadithPlaying) {
      await hadithAudio.pause();
    } else {
      await hadithAudio.play(AssetSource("audios/ahdith1.mp3"));
    }
    setState(() {
      hadithPlaying = !hadithPlaying;
    });
  }

  Future<Waveform> generateWaveform(String filePath) async {
    final audioFile = File(filePath);
    final waveformFile = File('${filePath}_waveform.cache');

    final progress = JustWaveform.extract(
      audioInFile: audioFile,
      waveOutFile: waveformFile,
    );

    // ممكن تراقب التقدم لو حبيت
    await for (final p in progress) {
      print('Progress: ${(p.progress * 100).toStringAsFixed(2)}%');
    }

    return await JustWaveform.parse(waveformFile);
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("حديث النيات "),
        backgroundColor: Appcolor().secondrcolor,
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
              Text("سمع الحديث النبوي!"),
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
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
          Container(
            width: 360,
            height: 324,
            color: Colors.white,
            margin: EdgeInsets.all(12),
            child: Center(
              child: Text(
                "قَالَ : سَمِعْتُ رَسُولَ اللهِ ﷺ يَقُولُ : "
                " إِنَّمَا\n الأَعْمَالُ بِالنِّيَّاتِ ، وَإنَّمَا لِكُلِّ امْرِىءٍ مَا نَوَى ، فَمَنْ \nكَانَتْ هِجْرَتُهُ إِلى اللهِ وَرَسُوله فَهِجْرتُهُ إلى اللهِ  \n وَرَسُوُله ، وَمَنْ كَانَتْ هِجْرَتُهُ لِدُنْيَا يُصِيْبُهَا  أو مرأة\n ينكحها فهجرته إلى ما هاجر إليه",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 120),
            child: MaterialButton(
              minWidth: 160,
              height: 40,
              color: Appcolor().secondrcolor,
              onPressed: () {},
              child: Text(
                "عرض النتيجة ",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Container(
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(colors: [
                  Color(0xff9FCAD7),
                  Color(0xffFFFFFF),
                ])),
            child: Row(
              children: [
                SizedBox(
                  height: 100,
                ),
                Slider(
                    min: 0,
                    value: 0,
                    onChanged: (value) async {
                      final newposition = Duration(seconds: value.toInt());
                      await hadithAudio.seek(newposition);
                    }),
                InkWell(
                  child: Icon(
                    isPlaying ? Icons.pause : Icons.play_arrow,
                  ),
                  onTap: () async {
                    await hadithAudio.pause();
                    setState(() {
                      isPlaying = false;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: HadithbootmeBar(context),
    );
  }

  NavigationBar HadithbootmeBar(BuildContext context) {
    return NavigationBar(
        backgroundColor: Appcolor().secondrcolor,
        onDestinationSelected: (value) async {
          if (value == 1) {
            await hadithAudio.play(AssetSource("audios/ahdith1.mp3"));
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (_) => HistoryAudios()));
          }
          if (value == 2) {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => AudioRecorderScreen()));
          }
          setState(() {
            currentIndex = value;
          });
        },
        selectedIndex: currentIndex,
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.arrow_back_ios),
            label: "السابق",
            tooltip: '  اسمع الحديث السابق ',
          ),
          NavigationDestination(
            icon: Icon(Icons.headphones),
            label: "استماع",
            tooltip: 'اسمع الحديث',
          ),
          NavigationDestination(
            icon: Icon(Icons.mic),
            label: "تسميع",
            tooltip: 'سمع الحديث',
          ),
          NavigationDestination(
            icon: Icon(Icons.arrow_forward_ios),
            label: "التالي",
            tooltip: "اسمع الحديث التالي",
          ),
        ]);
  }
}
