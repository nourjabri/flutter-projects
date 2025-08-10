import 'package:audioapp/mainbuttons/colors.dart';
import 'package:audioapp/view/home.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Color backgroundColor = Colors.white;
  bool showLogo = false;

  @override
  void initState() {
    super.initState();
//1
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        backgroundColor = Appcolor().primarycolor;
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
        backgroundColor = Colors.blue.shade400;
        showLogo = true;
      });
    });
    //4
    //
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        showLogo = true;
      });
    });

    Future.delayed(const Duration(seconds: 4), () {
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) => Home()),
      // );
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
                "",
              )
            : const SizedBox(),
      ),
    );
  }
}
