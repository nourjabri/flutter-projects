import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:restaurant_mang/pages/account/register.dart';
import '../config.dart';

class Tips extends StatefulWidget {
  @override
  _TipsState createState() => _TipsState();
}

class _TipsState extends State<Tips> {
  var tipsarr = [
    {
      "title": "Mange your restaurant in easy way",
      "info": "Qlick now",
      "image": "assets/images/2.png",
    },
    {
      "title": "Mange your restaurant in easy way",
      "info": "Qlick now2",
      "image": "assets/images/3.png",
    },
    {
      "title": "Mange your restaurant in easy way",
      "info": "Qlick now3",
      "image": "assets/images/3.png",
    }
  ];

  @override
  Widget build(BuildContext context) {
    double myheight = MediaQuery.of(context).size.height / 6;
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            new Container(
                padding: EdgeInsets.only(
                  top: 64.0,
                  right: 24.0,
                ),
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  child: Text(
                    "Login",
                    style: TextStyle(color: primaryColor, fontSize: 24),
                  ),
                )),
            Container(
              height: myheight * 4,
              child: PageIndicatorContainer(
                shape: IndicatorShape.circle(),
                length: tipsarr.length,
                align: IndicatorAlign.bottom,
                padding: EdgeInsets.only(top: 300),
                indicatorColor: thirdColor,
                indicatorSelectorColor: Colors.red,
                child: PageView.builder(
                    physics: AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: tipsarr.length,
                    itemBuilder: (BuildContext context, i) {
                      return SingleTips(
                          title: tipsarr[i]["title"]!,
                          info: tipsarr[i]["info"]!,
                          image: tipsarr[i]["image"]!);
                    }),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16),
                child: ListView(
                  children: <Widget>[
                    Column(
                      textDirection: TextDirection.ltr,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        MaterialButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Register()));
                          },
                          child: Container(
                            height: myheight / 3,
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                color: fourColor),
                            child: Text(
                              "Create account",
                              style:
                                  const TextStyle(color: secondryColor, fontSize: 24),
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
            style: TextStyle(
              color: Colors.green,
              fontSize: 16,
            ),
          ),
        ),
        new Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            info,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
