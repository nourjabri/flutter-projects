import 'package:flutter/material.dart';
import 'package:clickresturant/Core/constants/config.dart';
import 'package:clickresturant/presentation/screens/login.dart';
import 'package:clickresturant/presentation/screens/register.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Tips extends StatefulWidget {
  @override
  _TipsState createState() => _TipsState();
}

class _TipsState extends State<Tips> {
  var tipsarr = [
    {
      "title": "Mange your restaurant in easy way",
      "info": "Click now",
      "image": "assets/images/2.png",
    },
    {
      "title": "Mange your restaurant in easy way",
      "info": "Click now",
      "image": "assets/images/3.png",
    },
    {
      "title": "Mange your restaurant in easy way",
      "info": "Click now",
      "image": "assets/images/4.png",
    }
  ];

  @override
  Widget build(BuildContext context) {
    double myheight = MediaQuery.of(context).size.height / 6;
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
              height: myheight * 4,
              child: Column(
                children: [
                  Expanded(
                      child: PageView.builder(
                          controller: PageController(),
                          scrollDirection: Axis.horizontal,
                          itemCount: tipsarr.length,
                          itemBuilder: (context, i) {
                            return SingleTips(
                                title: tipsarr[i]["title"]!,
                                info: tipsarr[i]["info"]!,
                                image: tipsarr[i]["image"]!);
                          })),
                  const SizedBox(
                    height: 10,
                  ),
                  SmoothPageIndicator(
                      controller: PageController(),
                      effect: const ExpandingDotsEffect(
                          activeDotColor: primaryColor,
                          // dotColor: thirdColor,
                          dotHeight: 10,
                          dotWidth: 10),
                      count: tipsarr.length)
                ],
              )),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: ListView(
                children: <Widget>[
                  Column(
                    textDirection: TextDirection.ltr,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          height: 60,
                          width: 250,
                          decoration: BoxDecoration(
                              color: fourColor,
                              borderRadius: BorderRadius.circular(8)),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Login()));
                            },
                            child: const Center(
                              child: Text(
                                "Let's get started",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Register()));
                        },
                        child: const Text(
                          "Create account",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SingleTips extends StatelessWidget {
  final String title;
  final String info;
  final String image;

  SingleTips({required this.title, required this.info, required this.image});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            alignment: Alignment.center,
            child: Image.asset(image, fit: BoxFit.cover),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.green,
              fontSize: 16,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            info,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
