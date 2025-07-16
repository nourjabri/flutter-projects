import 'package:flutter/material.dart';

import 'homepage.dart';

class SplashSCreen extends StatefulWidget {
  const SplashSCreen({super.key});

  @override
  State<SplashSCreen> createState() => _SplashSCreenState();
}

class _SplashSCreenState extends State<SplashSCreen> {
  @override
  void inistate() {
    super.initState();
    Future.delayed(Duration(seconds: 2));
    if (mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (contex) => Homescreen()),
      );
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/splash.png")),
        ),
      ),
    );
  }
}
