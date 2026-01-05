import 'package:fashionproject/Presentation/screens/widgets/primryButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Forgetpassword extends StatelessWidget {
  const Forgetpassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
           
            Text(
              "Forget Password",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 32),
            ),
            SizedBox(height: 30),
            Text(
              "Please enter your email address. You will receive a link to create a new password via email.",
              style: TextStyle(color: Color(0xff6D6C6C)),
            ),
            SizedBox(height: 50),
            Card(
              elevation: 2,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Email",
                ),
              ),
            ),
            SizedBox(height: 50),
            Primrybutton(
              onPressButton: () {},
              titleButton: "Send",
              textColor: Colors.white,
              buttonColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
