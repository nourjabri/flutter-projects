import 'package:flutter/material.dart';
import 'package:orbitproject/providers/auth_provider.dart';
import 'package:orbitproject/screens/home.dart';
import 'package:orbitproject/screens/signup_screen.dart';
import 'package:orbitproject/widgets/signup_widget.dart';
import 'package:provider/provider.dart';

class Loginscreen extends StatelessWidget {
  Loginscreen({super.key});
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Login ',
              style: TextStyle(color: Color(0xff458393), fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                spacing: 10.5,
                children: [
                  signupWidget(
                    controller: usernameController,
                    label: Text("Enter your username"),
                    fieldType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your username";
                      }

                      return null;
                    },
                    obscureText: false,
                    preicon: Icon(Icons.person),
                  ),

                  signupWidget(
                    controller: passwordController,
                    obscureText: true,
                    label: Text("enter your password"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Plase enter your password";
                      }
                      if (value.length < 6) {
                        return "Password must al least 6 characters";
                      }
                      return null;
                    },
                    preicon: Icon(Icons.lock),
                    fieldType: TextInputType.text,
                  ),

                  SizedBox(height: 50),
                  Consumer<AuthProvider>(
                    builder: (context, authProvider, child) {
                      return ElevatedButton(
                        onPressed: authProvider.isLoading
                            ? null
                            : () async {
                                final success = await context
                                    .read<AuthProvider>()
                                    .login(
                                      username: usernameController.text,
                                      password: passwordController.text,
                                    );
                                if (success) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      backgroundColor: Color(0xffFFDCB6),
                                      content: Text(
                                        "Login Successfully",
                                        style: TextStyle(
                                          color: Color(0xff458393),
                                        ),
                                      ),
                                    ),
                                  );
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => HomeScreen(),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      backgroundColor: Color(0xffFFDCB6),
                                      content: Text(
                                        authProvider.errormessage,
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
                                  "Login Now",
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
                        MaterialPageRoute(builder: (_) => SignupScreen()),
                      );
                    },
                    child: Text("Don't have an account? Sign up Now "),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
