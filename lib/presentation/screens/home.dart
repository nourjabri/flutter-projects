
import 'package:clickresturant/presentation/widgets/imgNetwork.dart';
import 'package:clickresturant/presentation/widgets/navBar.dart';
import 'package:clickresturant/presentation/widgets/oneProduct.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clickresturant/Core/constants/config.dart';
import 'package:clickresturant/logic/bloc/productBloc/products_bloc.dart';
import 'package:clickresturant/presentation/widgets/drawer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _keydrawer = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    context.read<ProductsBloc>().add(FetchProducts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Click Resturant",
            style: TextStyle(
                fontSize: 24, color: fourColor, fontWeight: FontWeight.bold),
          ),
        ),
        key: _keydrawer,
        drawer: HomeDrawer(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const HomeSlider(),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Choose your favorite now!!",
                style: TextStyle(fontSize: 22),
              ),
            ),
            Expanded(child: BlocBuilder<ProductsBloc, ProductsState>(
                builder: (context, state) {
              if (state is Productsloaded) {
                return ListView.builder(
                  itemCount: state.products.length,
                  itemBuilder: (context, index) {
                    final product = state.products[index];
                    return Oneproduct(product: product);
                  },
                );
              }
              if (state is ProductsLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is ProductsFailed) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Failed to load products: ${state.message}"),
                      ElevatedButton(
                        onPressed: () =>
                            context.read<ProductsBloc>().add(FetchProducts()),
                        child: const Text("Retry"),
                      ),
                    ],
                  ),
                );
              }

              return const Center(
                  child: Text(
                      "No products available. Please check your connection."));
            })),
          ],
        ),
        bottomNavigationBar: const BottomBar());
  }
}
