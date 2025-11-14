import 'package:flutter/material.dart';
import 'package:resturant_mang/Core/constants/config.dart';
import 'package:resturant_mang/presentation/screens/home.dart';

class ForgetPassword extends StatefulWidget {
  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
        ),
      ),
      body: Directionality(
        textDirection: TextDirection.ltr,
        child: Container(
          margin: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Form(
                  child: ListView(
                    children: <Widget>[
                      Container(
                        alignment: AlignmentDirectional.center,
                        height: 100,
                        child: const Text(
                          "Forget your Password",
                          style: TextStyle(
                            color: primaryColor,
                            fontSize: 28,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                        child: Text(
                          "Please enter your email to receive a link to create a new password via email",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(16),
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24.0),
                            color: Colors.white),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              hintText: "Email", border: InputBorder.none),
                          validator: (String? value) {
                            if (value!.isEmpty ||
                                value.indexOf(".") == -1 ||
                                value.indexOf("@") == -1) {
                              return "Please enter your email";
                            }
                          },
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Home()));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.all(8),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24.0),
                              color: fourColor),
                          child: const Text(
                            "Send ",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
