import 'package:flutter/material.dart';
import 'package:orbitproject/providers/auth_provider.dart';
import 'package:orbitproject/providers/product_provider.dart';
import 'package:orbitproject/screens/splash_screen.dart';

import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),

        ChangeNotifierProvider(create: (_) => ProductProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: token == null ? Loginscreen() : ProdcutsScren(),
        home: Splash(),
      ),
    );
  }
}
