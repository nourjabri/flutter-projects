import 'package:flutter/material.dart';
import 'package:restaurant_mang/pages/account/login.dart';
import 'package:restaurant_mang/pages/config.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
        ),
      ),
      body: Directionality(
        textDirection: TextDirection.ltr,
        child: Container(
          margin: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Form(
                  child: ListView(
                    children: <Widget>[
                      Container(
                        height: 100,
                        child: Text(
                          "Create your account",
                          style: TextStyle(
                            color: primaryColor,
                            fontSize: 32,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(16),
                        padding: EdgeInsets.only(left: 20.0, right: 20.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24.0),
                            color: Colors.white),
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: "First name", border: InputBorder.none),
                          validator: (String? value) {
                            if (value!.isEmpty || value.length < 1) {
                              return "Please enter the name";
                            }
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(16),
                        padding: EdgeInsets.only(left: 20.0, right: 20.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24.0),
                            color: Colors.white),
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: "Second name",
                              border: InputBorder.none),
                          validator: (String? value) {
                            if (value!.isEmpty || value.length < 1) {
                              return "Please enter your name";
                            }
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(16),
                        padding: EdgeInsets.only(left: 20.0, right: 20.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24.0),
                            color: Colors.white),
                        child: TextFormField(
                          decoration: InputDecoration(
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
                      Container(
                        margin: EdgeInsets.all(16),
                        padding: EdgeInsets.only(left: 20.0, right: 20.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24.0),
                            color: Colors.white),
                        child: TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: "Password", border: InputBorder.none),
                          validator: (String? value) {
                            if (value!.isEmpty || value.length < 6) {
                              return "Please enter your password";
                            }
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(16),
                        padding: EdgeInsets.only(left: 20.0, right: 20.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24.0),
                            color: Colors.white),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: "Phone number",
                              border: InputBorder.none),
                          validator: (String? value) {
                            if (value!.isEmpty || value.length < 1) {
                              return "Please enter your number";
                            }
                          },
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {},
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.all(8),
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24.0),
                              color: fourColor),
                          child: Text(
                            "Register now",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 12),
                        child: Text(
                            "by cliking the button make you agree the app condiotins"),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(10)),
              Container(
                padding: EdgeInsets.only(bottom: 24),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already an account? ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(color: thirdColor, fontSize: 16),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
