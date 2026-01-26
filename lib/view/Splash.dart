import 'package:adminapp/Theme/app_color.dart';
import 'package:adminapp/view/Loginscreen.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      if (mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => login_screen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 1920,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColor.primarycolor, AppColor.secondycolor],
          ),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "School\n ERP",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
            Image.asset("assets/images/schoolbackground.png"),
          ],
        ),
      ),
    );
  }
}
