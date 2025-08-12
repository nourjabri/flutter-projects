import 'package:audioapp/mainbuttons/colors.dart';
import 'package:audioapp/view/alhadith.dart';
import 'package:audioapp/view/register.dart';
import 'package:flutter/material.dart';

class welcome extends StatelessWidget {
  const welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolor().secondrcolor,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  " جاهز لتعلم المزيد ؟",
                  style: TextStyle(
                      color: Appcolor().secondrcolor,
                      fontFamily: "Cario",
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                Image.asset("assets/images/Login.png"),
                SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  minWidth: 312,
                  height: 54,
                  color: Appcolor().secondrcolor,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Register()));
                  },
                  child: Text(
                    "إنشاء حساب",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "تسجيل دخول ",
                          style: TextStyle(color: Colors.red),
                        )),
                    Text("لديك حساب بالفعل؟ ")
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Divider(
                      height: 50,
                      color: Appcolor().gray,
                    ),
                    Text("أو"),
                    Divider(
                      height: 50,
                      color: Appcolor().gray,
                      thickness: 2,
                    ),
                  ],
                ),
                Container(
                  width: 312,
                  height: 54,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Alhadith()),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      side:
                          BorderSide(color: Appcolor().secondrcolor, width: 2),
                    ),
                    child: const Text("تصفح التطبيق   "),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          " إدخال الرمز الخاص ",
                          style: TextStyle(color: Colors.red),
                        )),
                    Text("  منتسب لمعهد ما ؟ ")
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
