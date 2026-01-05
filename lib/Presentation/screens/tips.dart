import 'package:fashionproject/Presentation/screens/loginScreens.dart';
import 'package:fashionproject/Presentation/screens/myAccount.dart';
import 'package:fashionproject/Presentation/screens/splash.dart';
import 'package:fashionproject/core/utils/session_manger.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TipsScreen extends StatefulWidget {
  TipsScreen({super.key});

  @override
  State<TipsScreen> createState() => _TipsScreenState();
}

class _TipsScreenState extends State<TipsScreen> {
  final PageController controller = PageController();

  @override
  void initState() {
    super.initState();
    _checkSession();
  }

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Stack(
          children: [
            PageView(
              controller: controller,
              children: [
                buildTips("assets/images/background1.png"),
                buildTips("assets/images/background2.png"),
                buildTips("assets/images/background3.png"),
              ],
            ),
            Positioned(
              bottom: 70,
              left: 20,
              child: SmoothPageIndicator(
                controller: controller,

                effect: ExpandingDotsEffect(
                  radius: 8,
                  spacing: 10,
                  dotColor: Colors.white,
                  activeDotColor: Colors.black,
                ),
                count: 4,
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(28),
          ),
          backgroundColor: Colors.black,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SplashScreen()),
            );
          },
          child: Icon(Icons.arrow_forward_ios, color: Colors.white),
        ),
      ),
    );
  }

  Widget buildTips(String image) {
    return Stack(
      children: [SizedBox.expand(child: Image.asset(image, fit: BoxFit.cover))],
    );
  }

  Future<void> _checkSession() async {
    final loggedIn = await SessionManager.isLoggedIn();
    if (loggedIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => MyaccountScreen()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => Loginscreen()),
      );
    }
  }
}
