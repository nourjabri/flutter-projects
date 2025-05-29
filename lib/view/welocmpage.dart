import 'package:flutter/material.dart';

class Welocmpage extends StatelessWidget {
  const Welocmpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/welcome.png"),
          ),
        ),
        height: MediaQuery.sizeOf(context).height,
        child: Column(children: [

        ],),
      ),
    );
  }
}
