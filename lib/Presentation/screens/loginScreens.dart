import 'package:fashionproject/Presentation/screens/forgetPassword.dart';
import 'package:fashionproject/Presentation/screens/myAccount.dart';
import 'package:fashionproject/Presentation/screens/widgets/login.dart';
import 'package:fashionproject/Presentation/screens/widgets/primryButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Login",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 32),
              ),
            ),
            SizedBox(height: 30),
            LoginFrom(),
            SizedBox(height: 20),
            Primrybutton(
              onPressButton: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyaccountScreen()),
                );
              },
              titleButton: "Login",
              textColor: Colors.white,
              buttonColor: Colors.black,
            ),
            SizedBox(height: 10.h),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Forgetpassword()),
                );
              },
              child: Text(
                "forget your password",

                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Color(0xffB1AEAE),
                ),
              ),
            ),
            SizedBox(height: 120.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have account ?",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Color(0xffB1AEAE),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Color(0xff21C1E5),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
