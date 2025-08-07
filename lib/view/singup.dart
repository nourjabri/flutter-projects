import 'package:audioapp/view/login.dart';
import 'package:flutter/material.dart';

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
                        height: 100,
                        child: const Text(
                          "Create your account",
                          style: TextStyle(
                            // color: primaryColor,
                            fontSize: 32,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(16),
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24.0),
                          color: Colors.white,
                        ),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: "First name",
                            border: InputBorder.none,
                          ),
                          validator: (String? value) {
                            if (value!.isEmpty || value.length < 1) {
                              return "Please enter the name";
                            }
                          },
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(16),
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24.0),
                          color: Colors.white,
                        ),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: "Second name",
                            border: InputBorder.none,
                          ),
                          validator: (String? value) {
                            if (value!.isEmpty || value.length < 1) {
                              return "Please enter your name";
                            }
                          },
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(16),
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24.0),
                          color: Colors.white,
                        ),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: "Email",
                            border: InputBorder.none,
                          ),
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
                        margin: const EdgeInsets.all(16),
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24.0),
                          color: Colors.white,
                        ),
                        child: TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Password",
                            border: InputBorder.none,
                          ),
                          validator: (String? value) {
                            if (value!.isEmpty || value.length < 6) {
                              return "Please enter your password";
                            }
                          },
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(16),
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24.0),
                          color: Colors.white,
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            hintText: "Phone number",
                            border: InputBorder.none,
                          ),
                          validator: (String? value) {
                            if (value!.isEmpty || value.isEmpty) {
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
                          margin: const EdgeInsets.all(8),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24.0),

                            // color: fourColor
                          ),
                          child: const Text(
                            "Register now",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 12),
                        child: const Text(
                          "by cliking the button make you agree the app condiotins",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.all(10)),
              Container(
                padding: const EdgeInsets.only(bottom: 24),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already an account? ",
                      style: TextStyle(color: Colors.black, fontSize: 24),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      child: Text("Login", style: TextStyle(fontSize: 16)),
                    ),
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
