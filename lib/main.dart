import 'package:adminapp/Theme/app_color.dart';
import 'package:adminapp/Theme/theme_provider.dart';
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
import 'package:adminapp/view/Splash.dart';
import 'package:device_preview/device_preview.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

Future main() async {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: DevicePreview(
        enabled: true,
        tools: [...DevicePreview.defaultTools],
        builder: (context) => MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
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
            themeMode: themeProvider.themeMode,
            theme: ThemeData(
              useMaterial3: true,
              colorScheme: ColorScheme.fromSeed(
                seedColor: AppColor.primarycolor,
                brightness: Brightness.light,
              ),
              appBarTheme: AppBarTheme(),
            ),
            darkTheme: ThemeData(
              useMaterial3: true,
              colorScheme: ColorScheme.fromSeed(
                seedColor: AppColor.secondycolor,
                brightness: Brightness.dark,
              ),
            ),

            debugShowCheckedModeBanner: false,
            home: Splash(),
          ),
        );
      },
    );
  }
}
