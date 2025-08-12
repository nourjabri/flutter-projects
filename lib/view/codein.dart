import 'package:audioapp/mainbuttons/colors.dart';
import 'package:flutter/material.dart';

class Codein extends StatefulWidget {
  const Codein({super.key});

  @override
  State<Codein> createState() => _CodeinState();
}

class _CodeinState extends State<Codein> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolor().primarycolor,
      ),
      body: Column(
        children: [
          Text(
            "إعادة تعيين كلمة المرور",
            style: TextStyle(color: Appcolor().primarycolor),
          ),
          Text("أدخل رمز التحقق الذي تم إرساله "),
          Text("رمز التحقق"),
          Row(
            children: [],
          ),
          Row(
            children: [
              Text(
                " إرسال مرة أخرى ",
                style: TextStyle(color: Colors.red),
              ),
              Text("لم يصلك الرمز ؟")
            ],
          ),
          MaterialButton(
            minWidth: 312,
            height: 54,
            color: Appcolor().primarycolor,
            onPressed: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => CompRegister()));
            },
            child: Text(
              "تحقق ",
              style: TextStyle(
                  fontFamily: "Cario",
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
