import 'package:Firey/main.dart';
import 'package:Firey/view/home.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login here")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            spacing: 3,
            children: [
              TextField(
                controller: email,
                decoration: InputDecoration(hintText: 'Enter Your Email'),
              ),
              TextField(
                controller: password,
                obscureText: true,
                decoration: InputDecoration(hintText: 'Enter Your password'),
              ),
              SizedBox(height: 40),
              Container(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll<Color>(
                      Colors.amber,
                    ),
                  ),
                  onPressed: () async {
                    final result = await supabase.client.auth
                        .signInWithPassword(
                          password: password.text,
                          email: email.text,
                        );
                    if (result.user != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    }
                  },
                  child: Text(
                    'Login ',
                    style: TextStyle(color: Colors.blue, fontSize: 20),
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
