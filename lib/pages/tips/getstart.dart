import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_mang/pages/config.dart';
import 'package:restaurant_mang/pages/tips/tips.dart';

class GetStart extends StatefulWidget {
  @override
  _GetStartState createState() => _GetStartState();
}

class _GetStartState extends State<GetStart> {
  @override
  Widget build(BuildContext context) {
    double myheight = (MediaQuery.of(context).size.height / 3) * 2;
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
                height: myheight,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                        image: AssetImage("assets/images/people-having.png"),
                        fit: BoxFit.contain))),
            new Container(
              height: myheight / 2,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: primaryColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    )
                  ],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: ListView(
                children: <Widget>[
                  Column(
                    textDirection: TextDirection.ltr,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Smart Restaurant",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Mange Your Restaurant in easy way",
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white),
                      ),
                      Padding(padding: EdgeInsets.only(top: 20)),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Tips();
                          }));
                        },
                        child: Container(
                            height: 50,
                            padding: EdgeInsets.only(
                                left: 20.0,
                                right: 20.0,
                                top: 10.0,
                                bottom: 7.0),
                            decoration: BoxDecoration(
                                color: fourColor,
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Text(
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
