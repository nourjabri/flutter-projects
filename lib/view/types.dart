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
        title: Text("المقرارات", style: TextStyle(color: Colors.white)),
        backgroundColor: Appcolor().primarycolor,
      ),
      body: Column(
        children: [
          SizedBox(
            width: 300,
            height: 600,
            child: ListView.builder(
                itemBuilder: (context, index) => Card(
                      child: Row(
                        children: [
                          Text(
                            "40",
                            style: TextStyle(fontSize: 50),
                          ),
                          Text("الآربعون النووية")
                        ],
                      ),
                    )),
          )
        ],
      ),
    );
  }
}
