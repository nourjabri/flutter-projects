import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resturant_mang/Core/constants/config.dart';
import 'package:resturant_mang/logic/bloc/products_bloc.dart';
import 'package:resturant_mang/presentation/screens/product_detailes.dart';

class Home extends StatefulWidget {
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
      drawer: const Drawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(child: BlocBuilder<ProductsBloc, ProductsState>(
              builder: (context, state) {
            if (state is ProductsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ProductsFailed) {
              return Center(
                child: Text("Error is ${state.message}"),
              );
            }
            if (state is Productsloaded) {
              return ListView.builder(
                  itemCount: state.products.length,
                  itemBuilder: (context, index) {
                    final product = state.products[index];
                    return SingleProduct(
                        proPrice: product.proPrice,
                        proId: product.proId,
                        proName: product.proName,
                        proDec: product.proDec,
                        proImg: product.proImage);
                  });
            }
            return const SizedBox();
          })),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: thirdColor,
        selectedFontSize: 16,
        unselectedItemColor: primaryColor,
        showSelectedLabels: true,
        unselectedFontSize: 12,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: ("notifications")),
          BottomNavigationBarItem(
              icon: Icon(Icons.restaurant_menu), label: ("offers")),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: ("my account")),
        ],
      ),
    );
  }
}

class SingleProduct extends StatelessWidget {
  final String? proId;
  final String? proName;
  final String? proDec;
  final String? proImg;
  final double proPrice;

  SingleProduct(
      {required this.proId,
      required this.proImg,
      required this.proDec,
      required this.proName,
      required this.proPrice});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductsDetail(
                        proId: proId.toString(),
                        proDec: proDec.toString(),
                        proImg: proImg.toString(),
                        proName: proName.toString(),
                        price: proPrice.toDouble(),
                      )));
        },
        child: Container(
          padding: const EdgeInsets.all(5),
          child: Column(
            verticalDirection: VerticalDirection.down,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                proName!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 5,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        fit: BoxFit.cover, image: NetworkImage(proImg!))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
