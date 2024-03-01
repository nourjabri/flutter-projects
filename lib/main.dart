import 'package:flutter/material.dart';
import 'package:restaurant_mang/pages/tips/getstart.dart';
import 'pages/config.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Splash(),
  ));
}

class Splash extends StatefulWidget {
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [secondryColor, primaryColor],
              begin: Alignment.topRight,
              end: Alignment.topLeft)),
      child: Column(
        children: [
          SizedBox(
            height: 200,
          ),
          Container(
              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/logo1.png"),
                      fit: BoxFit.contain))),
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GetStart()),
                );
              },
              child: Text("Welcome in Click Restaurant ",
                  style: TextStyle(
                    fontSize: 20,
                    color: fourColor,
                  ))),
        ],
      ),
    );
  }
}
