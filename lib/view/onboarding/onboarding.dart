import 'package:flutter/material.dart';
import 'package:zamazam/view/onboarding/onboarding2.dart';

class Onboarding extends StatelessWidget {
  final inidcatorcontroller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        spacing: 8,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/drink1.png"),
          Center(
            child: Text(
              "We provide best quality\n water ",
              style: TextStyle(
                fontSize: 24,
                color: Color(0xff625D5D),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            "Lorem ipsum dolor sit amet,\n consectetur adipiscing elit, sed ",
            style: TextStyle(color: Color(0xff625D5D), fontSize: 14),
          ),
          Container(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OnboardingSecond()),
                );
              },
              child: Center(
                child: Text(
                  "NEXT",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            ),
            width: 318,
            height: 60,
            decoration: BoxDecoration(color: Color(0xff5DCCFC)),
          ),
        ],
      ),
    );
  }
}
