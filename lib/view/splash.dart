import 'package:Firey/view/home.dart';
import 'package:flutter/material.dart';


class SplashSCreen extends StatefulWidget {
  const SplashSCreen({super.key});

  @override
  State<SplashSCreen> createState() => _SplashSCreenState();
}

class _SplashSCreenState extends State<SplashSCreen> {
  @override
  void inistate() {
    super.initState();
    Future.delayed(Duration(seconds: 3));
    if (mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (contex) => HomeScreen()),
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
