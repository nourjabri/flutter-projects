import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resturant_mang/Core/constants/config.dart';
import 'package:resturant_mang/logic/bloc/AuthBloc/auth_bloc.dart';
import 'package:resturant_mang/logic/bloc/AuthBloc/auth_event.dart';
import 'package:resturant_mang/logic/bloc/AuthBloc/auth_state.dart';
import 'package:resturant_mang/presentation/screens/login.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => const Center(
                    child: CircularProgressIndicator(),
                  ));
        } else if (state is AuthSuccess) {
          Navigator.pop(context);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Login()));
        } else if (state is AuthFailed) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: Scaffold(
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
                        const SizedBox(
                          height: 100,
                          child: Text(
                            "Create your account",
                            style: TextStyle(
                              color: primaryColor,
                              fontSize: 28,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(16),
                          padding:
                              const EdgeInsets.only(left: 20.0, right: 20.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24.0),
                              color: Colors.white),
                          child: TextFormField(
                            controller: firstName,
                            decoration: const InputDecoration(
                                hintText: "First name",
                                border: InputBorder.none),
                            validator: (String? value) {
                              if (value!.isEmpty || value.isEmpty) {
                                return "Please enter the name";
                              }
                              return null;
                            },
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(16),
                          padding:
                              const EdgeInsets.only(left: 20.0, right: 20.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24.0),
                              color: Colors.white),
                          child: TextFormField(
                            controller: lastName,
                            decoration: const InputDecoration(
                                hintText: "Last name",
                                border: InputBorder.none),
                            validator: (String? value) {
                              if (value!.isEmpty || value.isEmpty) {
                                return "Please enter your name";
                              }
                            },
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(16),
                          padding:
                              const EdgeInsets.only(left: 20.0, right: 20.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24.0),
                              color: Colors.white),
                          child: TextFormField(
                            controller: email,
                            decoration: const InputDecoration(
                                hintText: "Email", border: InputBorder.none),
                            validator: (String? value) {
                              if (value!.isEmpty ||
                                  !value.contains(".") ||
                                  !value.contains("@")) {
                                return "Please enter your email";
                              }
                            },
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(16),
                          padding:
                              const EdgeInsets.only(left: 20.0, right: 20.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24.0),
                              color: Colors.white),
                          child: TextFormField(
                            controller: password,
                            obscureText: true,
                            decoration: const InputDecoration(
                                hintText: "Password", border: InputBorder.none),
                            validator: (String? value) {
                              if (value!.isEmpty || value.length < 6) {
                                return "Please enter your password";
                              }
                            },
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(16),
                          padding:
                              const EdgeInsets.only(left: 20.0, right: 20.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24.0),
                              color: Colors.white),
                          child: TextFormField(
                            controller: phone,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                                hintText: "Phone number",
                                border: InputBorder.none),
                            validator: (String? value) {
                              if (value!.isEmpty || value.isEmpty) {
                                return "Please enter your number";
                              }
                            },
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {
                            context.read<AuthBloc>().add(RegisterEvent(
                                fristName: firstName.text,
                                lastName: lastName.text,
                                email: email.text,
                                password: password.text,
                                phone: phone.text));
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
                              "Register now",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
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
                        child: const Text(
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
      ),
    );
  }
}
