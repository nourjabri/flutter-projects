import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serapp/fajertheme.dart/fajartheme.dart';
import 'package:serapp/service/fajarthemeService.dart';
import 'package:serapp/service/location.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:serapp/publicBloc/publickhtmaBloc.dart';
import 'package:serapp/service/publicservice.dart';
import 'package:serapp/splash.dart';
  
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final themeProvider = ThemeProvider(ThemeData.light());
  final prayerService = PrayerTimeService();
  try {
    final position = await getCurrentLocation();
    final fajrTime = await prayerService.getFajrTime(
      position.latitude,
      position.longitude,
    );
    final now = DateTime.now();

    if (fajrTime != null &&
        now.isAfter(fajrTime) &&
        now.isBefore(fajrTime.add(const Duration(hours: 1)))) {
      themeProvider.setFajrTheme();
    } else {
      themeProvider.setNormalTheme();
    }
  } catch (e) {
    print('Error during theme setup: $e');
  }

  // await dotenv.load(fileName: ".env");
  await Supabase.initialize(
    url: 'https://uhnzukuotznhcetikaqz.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVobnp1a3VvdHpuaGNldGlrYXF6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTM0Njk3MDIsImV4cCI6MjA2OTA0NTcwMn0.8XlNsMnTOuSQUxKITfVQIwUhsB-Q1VWSFrCn3i2zfpw',
  );
  final session = Supabase.instance.client.auth.currentSession;
  if (session == null) {
    await Supabase.instance.client.auth.signInAnonymously();
  }
  runApp(ChangeNotifierProvider.value(value: themeProvider, child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
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
