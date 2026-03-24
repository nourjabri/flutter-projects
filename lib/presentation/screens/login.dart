import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clickresturant/Core/constants/config.dart';
import 'package:clickresturant/logic/bloc/AuthBloc/auth_bloc.dart';
import 'package:clickresturant/logic/bloc/AuthBloc/auth_event.dart';
import 'package:clickresturant/logic/bloc/AuthBloc/auth_state.dart';
import 'package:clickresturant/presentation/screens/forgetpassword.dart';
import 'package:clickresturant/presentation/screens/home.dart';
import 'package:clickresturant/presentation/screens/register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

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
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Login",
            style: TextStyle(
                fontSize: 24, color: fourColor, fontWeight: FontWeight.bold),
          ),
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Form(
                    child: ListView(
                      children: <Widget>[
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
                          padding: const EdgeInsets.only(left: 180, bottom: 20),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ForgetPassword()));
                            },
                            child: const Text(
                              "Forget Your Password",
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            context.read<AuthBloc>().add(LoginEvent(
                                email: email.text, password: password.text));
                          },
                          child: Container(
                              height: 60,
                              padding: const EdgeInsets.only(
                                  left: 20.0,
                                  right: 20.0,
                                  top: 10.0,
                                  bottom: 7.0),
                              decoration: BoxDecoration(
                                  color: fourColor,
                                  borderRadius: BorderRadius.circular(16)),
                              child: const Text(
                                "Login",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: secondryColor,
                                ),
                              )),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(children: <Widget>[
                            Expanded(child: Divider()),
                            Text("OR"),
                            Expanded(child: Divider()),
                          ]),
                        ),
                        GestureDetector(
                          onTap: () {
                            context.read<AuthBloc>().add(LoginEvent(
                                email: email.text, password: password.text));
                          },
                          child: Container(
                              height: 60,
                              padding: const EdgeInsets.only(
                                  left: 20.0,
                                  right: 20.0,
                                  top: 10.0,
                                  bottom: 7.0),
                              decoration: BoxDecoration(
                                  border: BoxBorder.all(
                                      color: Colors.grey, width: 2),
                                  borderRadius: BorderRadius.circular(16)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset("assets/images/google.png"),
                                  const Text(
                                    "Login with Google",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 50),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have  an account? ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
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
