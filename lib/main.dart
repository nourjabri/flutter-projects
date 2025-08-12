import 'package:audioapp/Bloc/AuthBloc/authbloc_bloc.dart';
import 'package:audioapp/service/authservice.dart';
import 'package:audioapp/view/register.dart';
import 'package:audioapp/view/singup.dart';
import 'package:audioapp/view/splash.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  await SentryFlutter.init(
    (options) {
      options.dsn =
          'https://8085825cbf94074b84b613658aabeba6@o4509826838233088.ingest.de.sentry.io/4509826842361936';
      // Adds request headers and IP for users,
      // visit: https://docs.sentry.io/platforms/dart/data-management/data-collected/ for more info
      options.sendDefaultPii = true;
    },
    appRunner: () => runApp(
      SentryWidget(
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(AuthService(dioauth: Dio())),
          ),
        ],
        child: MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen()),
      ),
    );
  }
}
