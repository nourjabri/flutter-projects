import 'package:fashionproject/Presentation/screens/loginScreens.dart';
import 'package:fashionproject/Presentation/screens/registerScreen.dart';
import 'package:fashionproject/Presentation/screens/widgets/primryButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset("assets/images/background4.png"),

            Positioned(
              bottom: 20.w,
              left: 70.h,
              child: Column(
                children: [
                  Primrybutton(
                    onPressButton: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Registerscreen(),
                        ),
                      );
                    },
                    textColor: Colors.black,
                    titleButton: 'SIGN UP ',
                    buttonColor: Colors.white,
                  ),
                  SizedBox(height: 40),
                  Primrybutton(
                    onPressButton: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Loginscreen()),
                      );
                    },
                    titleButton: 'LOGIN ',
                    textColor: Colors.white,
                    buttonColor: Colors.black,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
