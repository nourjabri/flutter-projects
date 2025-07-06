import 'package:adminapp/bloc/TeacherBloc/teacher_bloc.dart';
import 'package:adminapp/bloc/auth_bloc/auth_bloc.dart';
import 'package:adminapp/bloc/busmentor_bloc/busmentor_bloc.dart';
import 'package:adminapp/bloc/classes/classes_bloc.dart';
import 'package:adminapp/bloc/parent_bloc/parent_bloc.dart';
import 'package:adminapp/bloc/students/students_bloc.dart';
import 'package:adminapp/service/auth_service.dart';
import 'package:adminapp/service/busmentor_service.dart';
import 'package:adminapp/service/class_service.dart';
import 'package:adminapp/service/parent_service.dart';
import 'package:adminapp/service/student_sercive.dart';
import 'package:adminapp/service/teacher_service.dart';
import 'package:adminapp/view/Loginscreen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      //designSize: const Size(1920, 800),
      splitScreenMode: true,
      builder: (_, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => AuthBloc(AuthService(dioauth: Dio())),
            ),
            BlocProvider(create: (context) => TeacherBloc(TeacherService())),

            BlocProvider(create: (context) => ParentBloc(ParentService())),
            BlocProvider(
              create: (context) => BusmentorBloc(BusMentorService()),
            ),
            BlocProvider(
              create: (context) => ClassesBloc(TeacherClassService()),
            ),
            BlocProvider(create: (context) => StudentsBloc(StundetService())),
          ],

          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: LoginScreen(),
          ),
        );
      },
    );
  }
}
