import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zamazam/theme/appcolor.dart';
import 'package:zamazam/view/onboarding/four_onboarding.dart';
import 'package:zamazam/view/onboarding/onboarding.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:zamazam/view/onboarding/onboarding2.dart';
import 'package:zamazam/view/onboarding/third_onboarding.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final PageController pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 600,
              child: PageView(
                controller: pageController,
                children: [
                  Onboarding(),
                  OnboardingSecond(),
                  ThirdOnboarding(),
                  FourOnboarding(),
                ],
              ),
            ),
            SmoothPageIndicator(
              controller: pageController,
              count: 4,
              effect: const WormEffect(
                activeDotColor: Color(0xff5DCCFC),
                dotColor: Color(0xffF2F2F2),
                dotHeight: 16,
                dotWidth: 16,
                type: WormType.thinUnderground,
              ),
            ),
            Container(
              height: 60.h,
              width: 318.h,
              color: AppColors.primary,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "LOGIN",
                  style: TextStyle(color: AppColors.headlineTextColor),
                ),
              ),
            ),
            Row(
              children: [
                Text(
                  "Don’t  have an account? ",
                  style: TextStyle(color: AppColors.secondary),
                ),
                Text(" Sign UP", style: TextStyle(color: AppColors.primary)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
