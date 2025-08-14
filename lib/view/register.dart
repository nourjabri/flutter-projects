import 'package:audioapp/Bloc/registerBloc/registerbloc_bloc.dart';
import 'package:audioapp/mainbuttons/colors.dart';
import 'package:audioapp/model/StudentModel.dart';
import 'package:audioapp/view/types.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController conpaswordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state is SuccessCreateStudent) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Types()),
          );
        } else if (state is FailedCreateStudnet) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('فشل إنشاء الحساب: ${state.message}')),
          );
        }
      },
      child: Scaffold(
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
                      fontFamily: "Cairo",
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
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
                        Text("كلمة المرور",
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
                        Text("تأكيد كلمة المرور ",
                            style: TextStyle(
                                fontFamily: "Cario",
                                fontSize: 16,
                                fontWeight: FontWeight.w400)),
                        TextField(
                          obscureText: true,
                          controller: conpaswordcontroller,
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
                            style: TextStyle(
                              color: Colors.red,
                              fontFamily: "Cairo",
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                            ),
                          )),
                      Text(
                        "  منتسب لمعهد ما ؟ ",
                        style: TextStyle(
                          fontFamily: "Cairo",
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                  MaterialButton(
                    minWidth: 312,
                    height: 54,
                    color: Appcolor().primarycolor,
                    onPressed: () {
                      final student = Studentmodel(
                        name: namecontroller.text,
                        email: emailcontroller.text,
                        password: passwordcontroller.text,
                      );
                      context
                          .read<RegisterBloc>()
                          .add(CreateStudentEvent(studentmodel: student));
                    },
                    child: Text(
                      "التالي",
                      style: TextStyle(
                        fontFamily: "Cairo",
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
