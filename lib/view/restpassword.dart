import 'package:audioapp/mainbuttons/colors.dart';
import 'package:audioapp/view/code.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Restpassword extends StatefulWidget {
  const Restpassword({super.key});

  @override
  State<Restpassword> createState() => _RestpasswordState();
}

class _RestpasswordState extends State<Restpassword> {
  TextEditingController emailcontroller = TextEditingController();
  String message = '';
  Future<void> resetPassword() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailcontroller.text.trim());
      setState(() {
        message = 'تم إرسال رابط إعادة التعيين إلى بريدك الإلكتروني.';
      });
    } catch (e) {
      setState(() {
        message = 'حدث خطأ: ${e.toString()}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolor().primarycolor,
      ),
      body: Center(
        child: Container(
          color: Colors.white,
          width: 350,
          height: 700,
          child: Column(
            children: [
              Text("إعادة تعيين كلمة المرور",
                  style: TextStyle(
                      color: Appcolor().primarycolor,
                      fontFamily: "Cairo",
                      fontSize: 20,
                      fontWeight: FontWeight.w700)),
              Image.asset("assets/images/rest.png"),
              Center(
                  child: Text(
                      "  سنرسل لبريدك الإلكتروني رمز تحقق    \nمن 6 خانات ",
                      style: TextStyle(
                          fontFamily: "Cairo",
                          color: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.w400))),
              Padding(
                padding: const EdgeInsets.only(left: 120),
                child: Text("البريد الالكتروني",
                    style: TextStyle(
                        fontFamily: "Cairo",
                        color: Colors.grey,
                        fontSize: 20,
                        fontWeight: FontWeight.w400)),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: emailcontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Appcolor().gray)),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              MaterialButton(
                minWidth: 312,
                height: 54,
                color: Appcolor().primarycolor,
                onPressed: () {
                  resetPassword();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CodeConfirm()));
                },
                child: Text(
                  "إرسال الرمز ",
                  style: TextStyle(
                      fontFamily: "Cairo",
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
