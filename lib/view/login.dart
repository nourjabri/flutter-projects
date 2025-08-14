import 'package:audioapp/Bloc/AuthBloc/authbloc_bloc.dart';
import 'package:audioapp/mainbuttons/colors.dart';
import 'package:audioapp/service/authservice.dart';
import 'package:audioapp/view/alhadith.dart';
import 'package:audioapp/view/restpassword.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolor().primarycolor,
      ),
      body: BlocListener<AuthBloc, AuthblocState>(
        listener: (context, state) {
          if (state is SuccessAuth) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => AlhadithScreen()),
            );
            return;
          } else if (state is FailedAuth) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
          Navigator.of(context, rootNavigator: true).pop();
        },
        child: Column(
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
                    "تسجيل دخول ",
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
                        Text("كلمةالمرور",
                            style: TextStyle(
                                fontFamily: "Cario",
                                fontSize: 16,
                                fontWeight: FontWeight.w400)),
                        TextField(
                          controller: passwordcontroller,
                          obscureText: true,
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
                          child: Text(" إعادة تعيين كلمة المرور  ؟  ",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontFamily: "Cario",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400))),
                      TextButton(
                        child: Text(" نسيت كلمة المرور ؟ "),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Restpassword()));
                        },
                      )
                    ],
                  ),
                  MaterialButton(
                    minWidth: 312,
                    height: 54,
                    color: Appcolor().primarycolor,
                    onPressed: () {
                      AuthService(dioauth: Dio()).checkauth(
                          emailcontroller.text, passwordcontroller.text);
                    },
                    child: Text(
                      "تسجيل دخول ",
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
      ),
    );
  }
}
