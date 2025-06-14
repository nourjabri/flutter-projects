import 'package:flutter/material.dart';
import 'package:zamazam/view/onboarding/onboarding2.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/images/drink1.png"),
        const Text(
          "We provide best quality\n water ",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            color: Color(0xff625D5D),
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          "Lorem ipsum dolor sit amet,\n consectetur adipiscing elit, sed ",
          textAlign: TextAlign.center,
          style: TextStyle(color: Color(0xff625D5D), fontSize: 14),
        ),
        const SizedBox(height: 24),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OnboardingSecond()),
            );
          },
          child: Container(
            width: 318,
            height: 60,
            decoration: BoxDecoration(color: Color(0xff5DCCFC)),
            child: Center(
              child: Text(
                "NEXT",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
