import 'package:audioapp/view/indexinghadith.dart';
import 'package:flutter/material.dart';
import 'package:audioapp/mainbuttons/colors.dart';

class Types extends StatefulWidget {
  const Types({super.key});

  @override
  State<Types> createState() => _TypesState();
}

class _TypesState extends State<Types> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("المقرارات",
            style: TextStyle(fontFamily: "Cairo", color: Colors.white)),
        backgroundColor: Appcolor().primarycolor,
      ),
      body: Center(
        child: Column(
          spacing: 5,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                8,
              )),
              height: 160,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Indexinghadith()));
                },
                child: Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "40",
                        style: TextStyle(
                            color: Appcolor().primarycolor,
                            fontSize: 60,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "الآربعون \nالنووية",
                        style: TextStyle(
                            color: Appcolor().primarycolor,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                8,
              )),
              height: 160,
              child: Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "75",
                      style: TextStyle(
                          color: Appcolor().primarycolor,
                          fontSize: 60,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "جوامع \n الإسلام ",
                      style: TextStyle(
                          color: Appcolor().primarycolor,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                8,
              )),
              height: 160,
              child: Card(
                child: Column(
                  children: [
                    Text(
                      "قريبا ",
                      style: TextStyle(
                          color: Appcolor().primarycolor,
                          fontSize: 60,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
