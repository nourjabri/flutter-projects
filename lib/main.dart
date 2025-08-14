import 'package:audioapp/Bloc/AuthBloc/authbloc_bloc.dart';
import 'package:audioapp/Bloc/registerBloc/registerbloc_bloc.dart';
import 'package:audioapp/service/authservice.dart';
import 'package:audioapp/view/splash.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await SentryFlutter.init(
    (options) {
      options.dsn =
          'https://8085825cbf94074b84b613658aabeba6@o4509826838233088.ingest.de.sentry.io/4509826842361936';
      options.tracesSampleRate = 1.0;
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
  try {
    int? test;
    test! + 3;
  } catch (error, stackTrace) {
    await Sentry.captureException(
      error,
      stackTrace: stackTrace,
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
          BlocProvider(
              create: (context) => RegisterBloc(AuthService(dioauth: Dio())))
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false, home: SplashScreen()),
      ),
    );
  }
}
