import 'package:audioapp/mainbuttons/colors.dart';
import 'package:flutter/material.dart';

class Tasmeahwidth extends StatefulWidget {
  const Tasmeahwidth({super.key});

  @override
  State<Tasmeahwidth> createState() => _TasmeahwidthState();
}

class _TasmeahwidthState extends State<Tasmeahwidth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolor().primarycolor,
        leading: Row(
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
            Image.asset(
              "assets/images/headphones.png",
              width: 28,
            ),
            Text(
              "80",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.person))],
      ),
      body: Column(
        children: [
          Container(
            width: 350,
            height: 200,
            decoration: BoxDecoration(
                color: Appcolor().litcolor,
                borderRadius: BorderRadius.circular(8)),
            child: Column(
              children: [
                Row(
                  children: [
                    Text("80"),
                    Text(" تسمعية ب "),
                    Text("500"),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
