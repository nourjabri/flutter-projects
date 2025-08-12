import 'package:audioapp/mainbuttons/colors.dart';
import 'package:audioapp/view/code.dart';
import 'package:flutter/material.dart';

class Restpassword extends StatefulWidget {
  const Restpassword({super.key});

  @override
  State<Restpassword> createState() => _RestpasswordState();
}

class _RestpasswordState extends State<Restpassword> {
  TextEditingController emailcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text("إعادة تعيين كلمة المرور"),
          Image.asset("assets/images/rest.png"),
          Text("  سنرسل لبريدك الإلكتروني رمز تحقق  \nمن 6 خانات "),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Text("البريد الالكتروني",
                style: TextStyle(
                    fontFamily: "Cario",
                    fontSize: 16,
                    fontWeight: FontWeight.w400)),
          ),
          TextField(
            controller: emailcontroller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Appcolor().gray)),
            ),
          ),
          MaterialButton(
            minWidth: 312,
            height: 54,
            color: Appcolor().primarycolor,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CodeConfirm()));
            },
            child: Text(
              "إرسال الرمز ",
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
