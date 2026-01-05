import 'package:fashionproject/Presentation/Logic/register/register_cubit.dart';
import 'package:fashionproject/Presentation/screens/loginScreens.dart';
import 'package:fashionproject/Presentation/screens/widgets/primryButton.dart';
import 'package:fashionproject/Presentation/screens/widgets/register.dart';
import 'package:fashionproject/domain/useCase/registerUserCase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Registerscreen extends StatelessWidget {
  Registerscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(RegisterUseCase()),
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            //   crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
              SizedBox(height: 30),
              RegisterForm(),
              SizedBox(height: 20),

              Primrybutton(
                onPressButton: () {
                  context.read<RegisterCubit>().register(
                    emial: "emial",
                    password: "password",
                  );
                },
                titleButton: 'SIGN UP ',
                textColor: Colors.white,
                buttonColor: Colors.black,
              ),
              SizedBox(height: 50),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have account ?",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Color(0xffB1AEAE),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Loginscreen()),
                      );
                    },
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Color(0xff21C1E5),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
