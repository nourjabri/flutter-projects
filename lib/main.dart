import 'package:flutter/material.dart';
import 'package:statemangment_intro/view/product_page.dart';
import 'package:statemangment_intro/view/theme_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: ProductPage());
  }
}
