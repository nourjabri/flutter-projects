import 'package:flutter/material.dart';

class FourOnboarding extends StatelessWidget {
  final inidcatorcontroller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          spacing: 8,
          children: [
            Image.asset("assets/images/drink4.png"),
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
                  onTap: () {},
                  child: Text(
                    "Get Started",
                    style: TextStyle(color: Colors.white),
                  ),
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
