import 'package:flutter/material.dart';
import 'package:orbitproject/providers/auth_provider.dart';
import 'package:orbitproject/screens/login_screen.dart';
import 'package:orbitproject/widgets/signup_widget.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController usernameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xffFFF3C8),
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Sign Up',
            style: TextStyle(
              color: Color(0xff458393),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    signupWidget(
                      controller: emailController,
                      label: Text("Enter your email"),
                      obscureText: false,
                      fieldType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your email address";
                        }
                        final emailRegex = RegExp(
                          r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                        );
                        if (!emailRegex.hasMatch(value)) {
                          return "Please enter a valid email address";
                        }
                        return null;
                      },
                      preicon: Icon(Icons.email),
                    ),
                    SizedBox(height: 20),
                    signupWidget(
                      controller: usernameController,
                      label: Text("enter your user name"),
                      obscureText: false,
                      preicon: Icon(Icons.person),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your username";
                        }

                        return null;
                      },
                      fieldType: TextInputType.text,
                    ),
                    SizedBox(height: 20),
                    signupWidget(
                      controller: passwordController,
                      obscureText: true,
                      label: Text("enter your password"),
                      preicon: Icon(Icons.lock),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Plase enter your password";
                        }
                        if (value.length < 6) {
                          return "Password must al least 6 characters";
                        }
                        return null;
                      },
                      fieldType: TextInputType.text,
                    ),

                    SizedBox(height: 20),
                    Consumer<AuthProvider>(
                      builder: (context, authProvider, child) {
                        return ElevatedButton(
                          onPressed: authProvider.isLoading
                              ? null
                              : () async {
                                  if (!_formKey.currentState!.validate()) {
                                    return;
                                  }
                                  final success = await context
                                      .read<AuthProvider>()
                                      .signup(
                                        username: usernameController.text,
                                        email: emailController.text,
                                        password: passwordController.text,
                                      );
                                  if (success) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: Color(0xffFFDCB6),
                                        content: Text(
                                          "Signing up done",
                                          style: TextStyle(
                                            color: Color(0xff458393),
                                          ),
                                        ),
                                      ),
                                    );
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => Loginscreen(),
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: Color(0xffFFDCB6),
                                        content: Text(
                                          context
                                              .read<AuthProvider>()
                                              .errormessage,
                                          style: TextStyle(
                                            color: Color(0xff458393),
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xffe5cb90),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(20),
                            ),
                          ),
                          child: authProvider.isLoading
                              ? const CircularProgressIndicator()
                              : Center(
                                  child: Text(
                                    "Sign Up Now",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xff458393),
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                        );
                      },
                    ),

                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => Loginscreen()),
                        );
                      },
                      child: Text("Already have an account? Login Now "),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
