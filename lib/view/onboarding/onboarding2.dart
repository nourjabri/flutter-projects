import 'package:flutter/material.dart';
import 'package:zamazam/view/onboarding/third_onboarding.dart';

class OnboardingSecond extends StatelessWidget {
  final inidcatorcontroller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          spacing: 8,
          children: [
            Image.asset("assets/images/drink2.png"),
            Text(
              "We provide best quality\n water ",
              style: TextStyle(
                fontSize: 24,
                color: Color(0xff625D5D),
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Schedule when you want \n your water delivered ",
              style: TextStyle(color: Color(0xff625D5D), fontSize: 14),
            ),
            Container(
              child: Center(
                child: InkWell(
                  onTap: () {
                    print("object");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ThirdOnboarding(),
                      ),
                    );
                  },
                  child: Text("Next", style: TextStyle(color: Colors.white)),
                ),
              ),
              width: 318,
              height: 60,
              decoration: BoxDecoration(color: Color(0xff5DCCFC)),
            ),
          ],
        ),
      ),
    );
  }
}
