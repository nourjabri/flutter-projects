import 'package:flutter/material.dart';
import 'package:resturant_mang/Core/constants/config.dart';
import 'package:resturant_mang/presentation/screens/tips.dart';

class get_start extends StatefulWidget {
  const get_start({super.key});

  @override
  _get_startState createState() => _get_startState();
}

class _get_startState extends State<get_start> {
  @override
  Widget build(BuildContext context) {
    double myheight = (MediaQuery.of(context).size.height / 3) * 2;
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
                height: myheight,
                padding: const EdgeInsets.all(15),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                        image: AssetImage("assets/images/people-having.png"),
                        fit: BoxFit.contain))),
            Container(
              height: myheight / 2,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: primaryColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    )
                  ],
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: ListView(
                children: <Widget>[
                  Column(
                    textDirection: TextDirection.ltr,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        "Smart Restaurant",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        "Mange Your Restaurant in easy way",
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white),
                      ),
                      const Padding(padding: EdgeInsets.only(top: 20)),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Tips();
                          }));
                        },
                        child: Container(
                            height: 50,
                            padding: const EdgeInsets.only(
                                left: 20.0,
                                right: 20.0,
                                top: 10.0,
                                bottom: 7.0),
                            decoration: BoxDecoration(
                                color: fourColor,
                                borderRadius: BorderRadius.circular(20.0)),
                            child: const Text(
                              "Strat from here",
                              style: TextStyle(
                                fontSize: 20.0,
                                color: secondryColor,
                              ),
                            )),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
