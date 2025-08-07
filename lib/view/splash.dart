import 'package:audioapp/view/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashSCreen extends StatefulWidget {
  const SplashSCreen({super.key});

  @override
  State<SplashSCreen> createState() => _SplashSCreenState();
}

class _SplashSCreenState extends State<SplashSCreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      if (mounted) {
        Navigator.push(context, MaterialPageRoute(builder: (contex) => Home()));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 400.w,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/splash.png")),
        ),
      ),
    );
  }
}
