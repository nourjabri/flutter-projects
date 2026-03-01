import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:quranapp/data/datasources/shop_remote_impl.dart';
import 'package:quranapp/data/repositories/repository_impl.dart';
import 'package:quranapp/presentation/cubit/shop_cubit.dart';
import 'package:quranapp/presentation/widgets/shopScreen.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await dotenv.load(fileName: ".env");
//   final remote = ShopRemoteDataSourceImpl(http.Client());
//   final repository = ShopRepositoryImpl(remote);
//   runApp(
//     BlocProvider(create: (context) => ShopCubit(repository), child: MyApp()),
//   );
// }

void main() {
  runApp(
    BlocProvider(
      create: (_) {
        final remote = ShopRemoteDataSourceImpl(http.Client());
        final repo = ShopRepositoryImpl(remote);
        return ShopCubit(repo)..fetchShops();
      },
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: ShopScreen());
  }
}
