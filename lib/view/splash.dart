import 'package:audioapp/mainbuttons/colors.dart';
import 'package:audioapp/view/welcome.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Color backgroundColor = Appcolor().secondrcolor;
  bool showLogo = false;

  @override
  void initState() {
    super.initState();
//1
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        backgroundColor = Appcolor().secondrcolor;
      });
    });
    //2
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        backgroundColor = Appcolor().primarycolor;
        showLogo = true;
      });
    });
    //3
    //
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        backgroundColor = Appcolor().primarycolor;
        chagelogosize();
      });
    });
    //4
    //
    Future.delayed(const Duration(seconds: 2), () {
      backgroundColor = Appcolor().primarycolor;
      setState(() {
        showLogo = true;
      });
    });
    Future.delayed(const Duration(seconds: 2), () {
      backgroundColor = Appcolor().secondrcolor;
      setState(() {
        showtext();
      });
    });
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => welcome()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      color: backgroundColor,
      child: Center(
        child: showLogo
            ? Image.asset(
                "assets/images/logo.png",
              )
            : const SizedBox(),
      ),
    );
  }
}

showtext() {
  Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(
        "assets/images/logo.png",
        width: 80,
      ),
      Text(
        "الحكمة",
        style: TextStyle(color: Appcolor().litcolor),
      ),
    ],
  );
}

chagelogosize() {
  Image.asset(
    "assets/images/logo.png",
    width: 200,
  );
}
