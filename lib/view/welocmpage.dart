import 'package:flutter/material.dart';

class Welocmpage extends StatelessWidget {
  const Welocmpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: DecoratedBox(
          decoration: BoxDecoration(
            //  color: Colors.red,
            image: DecorationImage(
              scale: 1,
              image: AssetImage("assets/images/welcome.png"),
              fit: BoxFit.cover,
            ),
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome to Drips water",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                "Water Delivery app",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Container(
                width: 318,
                height: 60,
                decoration: BoxDecoration(color: Colors.white),
                child: InkWell(
                  onTap: () {
                    /*   Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FourOnboarding()),
                    );*/
                  },
                  child: Center(
                    child: Text(
                      "Create an account",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
              Container(
                width: 318,
                height: 60,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                ),
                child: InkWell(
                  onTap: () {
                    /*   Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FourOnboarding()),
                    );*/
                  },
                  child: Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                "Continue as Guest",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
