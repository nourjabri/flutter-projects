import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            width: 30,
            height: 30,
            child: Image.asset("assets/images/arrowback.png"),
          ),
        ),
      ),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/paris.jpg"),
              ),
            ),
            height: 286,
            width: 385,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Go ahead and set up\n  your account",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "Sign in to enjoy the best managing experience",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: size.height * 0.30,
            left: 0,
            right: 0,
            child: Container(
              height: 580,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  TabBar(
                    tabs: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.all(
                              Radius.circular(15),
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: SizedBox(
                          width: 100,
                          height: 40,
                          child: Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.orange),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Register",
                          style: TextStyle(color: Colors.orange),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 500,
                    child: TabBarView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Email"),
                              TextField(
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.email_outlined,
                                    color: Colors.orange,
                                  ),
                                  labelText: "abdullahalkabbani.2002@gmail.com",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 15),

                              Text("Password"),
                              TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.lock_outline,
                                    color: Colors.orange,
                                  ),
                                  labelText: "***********",
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xffE2E8F0),
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Forget password",
                                  style: TextStyle(color: Color(0xff26A69A)),
                                ),
                              ),
                              SizedBox(
                                width: 326,
                                height: 50,
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    backgroundColor: Colors.orange,
                                    side: const BorderSide(color: Colors.white),
                                  ),
                                  onPressed: () {},
                                  child: const Text(
                                    "LogIn",
                                    style: TextStyle(
                                      fontFamily: "Montserrat",
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20.w),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Divider(
                                    color: Colors.amber,
                                    thickness: 20,
                                    indent: 10,
                                    endIndent: 10,
                                  ),
                                  Text(
                                    "Or login with",
                                    style: TextStyle(color: Color(0xff26A69A)),
                                  ),
                                  Divider(thickness: 20, indent: 50),
                                ],
                              ),
                              SizedBox(
                                width: 326,
                                height: 50,
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    backgroundColor: Colors.grey,
                                    side: const BorderSide(color: Colors.white),
                                  ),
                                  onPressed: () {},
                                  child: Row(
                                    children: [
                                      // Icon(Icons.goog)
                                      const Text(
                                        "Google",
                                        style: TextStyle(
                                          fontFamily: "Montserrat",
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Email"),
                                  TextField(
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.email_outlined,
                                        color: Colors.orange,
                                      ),
                                      labelText:
                                          "abdullahalkabbani.2002@gmail.com",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 15),

                                  Text("Password"),
                                  TextField(
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.lock_outline,
                                        color: Colors.orange,
                                      ),
                                      labelText: "***********",
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xffE2E8F0),
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Forget password",
                                      style: TextStyle(
                                        color: Color(0xff26A69A),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 326,
                                    height: 50,
                                    child: OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            15,
                                          ),
                                        ),
                                        backgroundColor: Colors.orange,
                                        side: const BorderSide(
                                          color: Colors.white,
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: const Text(
                                        "LogIn",
                                        style: TextStyle(
                                          fontFamily: "Montserrat",
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20.w),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Divider(
                                        color: Colors.amber,
                                        thickness: 20,
                                        indent: 10,
                                        endIndent: 10,
                                      ),
                                      Text(
                                        "Or login with",
                                        style: TextStyle(
                                          color: Color(0xff26A69A),
                                        ),
                                      ),
                                      Divider(thickness: 20, indent: 50),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 326,
                                    height: 50,
                                    child: OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            15,
                                          ),
                                        ),
                                        backgroundColor: Colors.grey,
                                        side: const BorderSide(
                                          color: Colors.white,
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: Row(
                                        children: [
                                          // Icon(Icons.goog)
                                          const Text(
                                            "Google",
                                            style: TextStyle(
                                              fontFamily: "Montserrat",
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
