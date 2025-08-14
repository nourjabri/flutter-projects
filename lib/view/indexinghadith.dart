import 'package:audioapp/mainbuttons/colors.dart';
import 'package:audioapp/view/alhadith.dart' hide alhadith;
import 'package:flutter/material.dart';

class Indexinghadith extends StatefulWidget {
  const Indexinghadith({super.key});

  @override
  State<Indexinghadith> createState() => _IndexinghadithState();
}

class _IndexinghadithState extends State<Indexinghadith> {
  List<String> numbersInWords = [
    "الأول",
    "الثاني",
    "الثالث",
    "الرابع",
    "الخامس",
    "السادس",
    "السابع",
    "الثامن",
    "التاسع",
    "العاشر",
    "الحادي عشر",
    "الثاني عشر",
    "الثالث عشر",
    "الرابع عشر",
    "الخامس عشر",
    "السادس عشر",
    "السابع عشر",
    "الثامن عشر",
    "التاسع عشر",
    "العشرون",
    "الحادي والعشرون",
    "الثاني والعشرون",
    "الثالث والعشرون",
    "الرابع والعشرون",
    "الخامس والعشرون",
    "السادس والعشرون",
    "السابع والعشرون",
    "الثامن والعشرون",
    "التاسع والعشرون",
    "الثلاثون",
    "الحادي والثلاثون",
    "الثاني والثلاثون",
    "الثالث والثلاثون",
    "الرابع والثلاثون",
    "الخامس والثلاثون",
    "السادس والثلاثون",
    "السابع والثلاثون",
    "الثامن والثلاثون",
    "التاسع والثلاثون",
    "الأربعون"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "الأربعون النووية",
          style: TextStyle(fontFamily: "Cairo", color: Colors.white),
        ),
        backgroundColor: Appcolor().primarycolor,
      ),
      body: ListView.builder(
        itemCount: numbersInWords.length,
        itemBuilder: (context, index) {
          return ListTile(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Card(
              shape: Border.all(color: Color(0xff9FCAD7)),
              color: Color(0xffE9FCFF),
              child: SizedBox(
                width: 360,
                height: 60,
                child: Center(
                    child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AlhadithScreen()));
                  },
                  child: Text(
                    "الحديث ${numbersInWords[index]}",
                    style: TextStyle(
                        color: Appcolor().primarycolor,
                        fontFamily: "Cairo",
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                )),
              ),
            ),
          );
        },
      ),
    );
  }
}
