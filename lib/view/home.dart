import 'package:audioapp/mainbuttons/colors.dart';
import 'package:flutter/material.dart';

class AlhadithScreen extends StatefulWidget {
  const AlhadithScreen({Key? key}) : super(key: key);

  @override
  State<AlhadithScreen> createState() => _AlhadithScreenState();
}

class _AlhadithScreenState extends State<AlhadithScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Appcolor().secondrcolor,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.person_2_outlined,
              color: Appcolor().gray,
            )),
        title: Text(
          "الأربعون النووية",
          style: TextStyle(color: Appcolor().gray),
        ),
      ),
      body: ListView.builder(
          itemBuilder: (context, index) => ListTile(
                title:
                    TextButton(onPressed: () {}, child: Text("الحديث $index")),
              )),
    );
  }
}
