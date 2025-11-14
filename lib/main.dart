import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resturant_mang/data/repositories/auth_repository.dart';
import 'package:resturant_mang/data/repositories/remote/product_service.dart';
import 'package:resturant_mang/logic/bloc/AuthBloc/auth_bloc.dart';
import 'package:resturant_mang/logic/bloc/products_bloc.dart';
import 'package:resturant_mang/presentation/screens/splash.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    
    BlocProvider(
        create: (_) => ProductsBloc(
            productService: ProductService(requestHandler: Dio()))),
    BlocProvider(create: (_) => AuthBloc(AuthRepository()))
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}
