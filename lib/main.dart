import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resturant_mang/data/repositories/auth_repository.dart';
import 'package:resturant_mang/data/repositories/remote/product_service.dart';
import 'package:resturant_mang/logic/bloc/AuthBloc/auth_bloc.dart';
import 'package:resturant_mang/logic/bloc/cartBloc/cart_bloc.dart';
import 'package:resturant_mang/logic/bloc/productBloc/products_bloc.dart';
import 'package:resturant_mang/presentation/screens/splash.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (_) => CartBloc()),
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
