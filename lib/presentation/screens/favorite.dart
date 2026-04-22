import 'package:clickresturant/presentation/widgets/navBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clickresturant/Core/constants/config.dart';
import 'package:clickresturant/data/model/favorite.dart';
import 'package:clickresturant/logic/bloc/favorite/favorite_bloc.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  List<FavoriteModel> items = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
        ),
        centerTitle: true,
        title: const Text(
          "My Favorite",
          style: TextStyle(
              fontSize: 24, color: fourColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: BlocBuilder<FavoriteBloc, FavoriteState>(
        builder: (context, state) {
          if (state is FavoriteLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is FavoriteEmpty) {
            return const Text("No Favorite Itmes");
          }
          // if (state is FavoriteLoaded && state.items.isEmpty) {
          //   return const Center(child: Text("No favorites yet"));
          // }

          if (state is FavoriteLoaded) {
            return ListView.builder(
              itemCount: state.items.length,
              itemBuilder: (_, i) {
                final p = state.items[i];
                return Card(
                  child: ListTile(
                    leading: Image.network(
                      p.proImage,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                    title: Text(p.proName),
                    subtitle: Text("${p.proPrice}\$"),
                  ),
                );
              },
            );
          }

          return const SizedBox(
            child: Text("Please Check Your Internet connection"),
          );
        },
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }
}
