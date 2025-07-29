import 'package:flutter/material.dart';
import 'package:serapp/khtmafunc/khtmaparts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:serapp/bloc/publickhtmaBloc.dart';
import 'package:serapp/service/publicservice.dart';
import 'package:serapp/splash.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_KEY']!,
  );
  final session = Supabase.instance.client.auth.currentSession;
  if (session == null) {
    await Supabase.instance.client.auth.signInAnonymously();
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ScreenUtilInit(
        designSize: Size(400, 852),
        minTextAdapt: true,
        splitScreenMode: true,

        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => KhatmaBloc(PublicKhtmaservice())),
          ],

          child: MaterialApp(
            debugShowCheckedModeBanner: false,

            home: SplashSCreen(),
          ),
        ),
      ),
    );
  }
}
