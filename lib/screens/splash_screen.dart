import 'package:flutter/material.dart';
import 'package:orbitproject/screens/home.dart';
import 'package:orbitproject/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    checkAuth();
  }

  void checkAuth() async {
    await Future.delayed(Duration(seconds: 6));
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
    if (!mounted) return null;
    if (token == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => Loginscreen()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/orbit.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Text(
            "Orbit Store from Nour Jabri",
            style: TextStyle(color: Color(0xff458393), fontSize: 16),
          ),
        ),
      ),
    );
  }
}
