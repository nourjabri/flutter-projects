import 'package:audioapp/Bloc/AuthBloc/authbloc_bloc.dart';
import 'package:audioapp/view/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    final username = usernameController.text.trim();
    final password = passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter both username and password")),
      );
      return;
    }
    context.read<AuthBloc>().add(Tryauth(email: username, password: password));
    try {
      final dio = Dio();
      final response = await dio.post(
        "https://school-managment-app-tqbh.onrender.com/admin/auth/login",
        data: {"username": username, "password": password},
      );

      final data = response.data;
      final accessToken = data['access_token'];
      final refreshToken = data['refresh_token'];

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('access_token', accessToken);
      await prefs.setString('refresh_token', refreshToken);

      print("Access Token Saved: $accessToken");
      print("Refresh Token Saved: $refreshToken");

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Login Successful")));

      // Navigate to home screen or do next step
    } catch (e) {
      print(" Login Failed: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login failed. Check credentials.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Here"), centerTitle: true),
      body: BlocListener<AuthBloc,AuthblocState >(
        listener: (context, state) {
          if (state is SuccessAuth) {
            // Navigator.pushReplacement(
            //   context,
            //   MaterialPageRoute(builder: (_) => Home()),
            // );
            return;
          } else if (state is FailedAuth) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
          Navigator.of(context, rootNavigator: true).pop();
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: usernameController,
                decoration: InputDecoration(labelText: "Username"),
              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(labelText: "Password"),
                obscureText: true,
              ),
              SizedBox(height: 16),
              ElevatedButton(onPressed: login, child: Text("Login")),
            ],
          ),
        ),
      ),
    );
  }
}
