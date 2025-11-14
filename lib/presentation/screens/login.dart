import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resturant_mang/Core/constants/config.dart';
import 'package:resturant_mang/logic/bloc/AuthBloc/auth_bloc.dart';
import 'package:resturant_mang/logic/bloc/AuthBloc/auth_event.dart';
import 'package:resturant_mang/logic/bloc/AuthBloc/auth_state.dart';
import 'package:resturant_mang/presentation/screens/forgetpassword.dart';
import 'package:resturant_mang/presentation/screens/home.dart';
import 'package:resturant_mang/presentation/screens/register.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
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
        }
        if (state is AuthSuccess) {
          Navigator.pop(context);
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Home()));
        }
        if (state is AuthFailed) {
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
                            "Login to your account",
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
                            controller: email,
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
                        Container(
                          margin: const EdgeInsets.all(16),
                          padding:
                              const EdgeInsets.only(left: 20.0, right: 20.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24.0),
                              color: Colors.white),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: password,
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                      hintText: "Password",
                                      border: InputBorder.none),
                                  validator: (String? value) {
                                    if (value!.isEmpty || value.length < 6) {
                                      return "Please enter your password";
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 180),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ForgetPassword()));
                            },
                            child: const Text(
                              "Forget Your Password",
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {
                            context.read<AuthBloc>().add(LoginEvent(
                                email: email.text, password: password.text));
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
                              "Login",
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
                        "Don't have  an account? ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Register()));
                        },
                        child: const Text(
                          "Register",
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
