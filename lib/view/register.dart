import 'package:audioapp/mainbuttons/colors.dart';
import 'package:audioapp/view/compRegister.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController datecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolor().primarycolor,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "إنشاء حساب ",
                  style: TextStyle(
                      color: Appcolor().primarycolor,
                      fontFamily: "Cario",
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Text("الاسم",
                            style: TextStyle(
                                fontFamily: "Cario",
                                fontSize: 16,
                                fontWeight: FontWeight.w400)),
                      ),
                      TextField(
                        controller: namecontroller,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Appcolor().gray)),
                        ),
                      ),
                      Text("تاريخ الميلاد",
                          style: TextStyle(
                              fontFamily: "Cario",
                              fontSize: 16,
                              fontWeight: FontWeight.w400)),
                      TextField(
                        controller: datecontroller,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Appcolor().gray)),
                        ),
                      ),
                      Text("رقم الهاتف",
                          style: TextStyle(
                              fontFamily: "Cario",
                              fontSize: 16,
                              fontWeight: FontWeight.w400)),
                      TextField(
                        controller: phonecontroller,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Appcolor().gray)),
                        ),
                      ),
                      Text("البريد الالكتروني",
                          style: TextStyle(
                              fontFamily: "Cario",
                              fontSize: 16,
                              fontWeight: FontWeight.w400)),
                      TextField(
                        controller: emailcontroller,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Appcolor().gray)),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
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
                MaterialButton(
                  minWidth: 312,
                  height: 54,
                  color: Appcolor().primarycolor,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CompRegister()));
                  },
                  child: Text(
                    "التالي ",
                    style: TextStyle(
                        fontFamily: "Cario",
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
