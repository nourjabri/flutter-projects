import 'package:flutter/material.dart';
import 'package:zamazam/view/onboarding/four_onboarding.dart';
import 'package:zamazam/view/onboarding/onboarding.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:zamazam/view/onboarding/onboarding2.dart';
import 'package:zamazam/view/onboarding/third_onboarding.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 600,
            child: PageView(
              controller: PageController(),
              children: [
                Onboarding(),
                OnboardingSecond(),
                ThirdOnboarding(),
                FourOnboarding(),
              ],
            ),
          ),
          SmoothPageIndicator(
            controller: PageController(),
            count: 3,
            effect: const WormEffect(
              dotColor: Color(0xff5DCCFC),
              dotHeight: 16,
              dotWidth: 16,
              type: WormType.thinUnderground,
            ),
          ),
          
        ],
      ),
    );
  }
}
