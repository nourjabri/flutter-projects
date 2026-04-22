import 'package:clickresturant/data/repositories/remote/Address_repository.dart';
import 'package:clickresturant/logic/bloc/AddressBloc/address_bloc.dart';
import 'package:clickresturant/logic/bloc/favorite/favorite_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clickresturant/data/repositories/auth_repository.dart';
import 'package:clickresturant/data/repositories/remote/product_service.dart';
import 'package:clickresturant/logic/bloc/AuthBloc/auth_bloc.dart';
import 'package:clickresturant/logic/bloc/UserProfile/user_profile_bloc.dart';
import 'package:clickresturant/logic/bloc/cartBloc/cart_bloc.dart';
import 'package:clickresturant/logic/bloc/productBloc/products_bloc.dart';
import 'package:clickresturant/presentation/screens/splash.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final firestore = FirebaseFirestore.instance;
  const userId = "test_user";
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (_) => FavoriteBloc(firestore, userId)),
    BlocProvider(create: (_) => UserProfileBloc(AuthRepository())),
    BlocProvider(create: (_) => CartBloc()),
    BlocProvider(
        create: (_) => ProductsBloc(
            productService: ProductService(requestHandler: Dio()))),
    BlocProvider(create: (_) => AuthBloc(AuthRepository())),
    BlocProvider(
        create: (_) => AddressBloc(addressRepository: AddressRepository()))
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
