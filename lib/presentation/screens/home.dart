import 'package:carousel_slider/carousel_slider.dart';
import 'package:clickresturant/presentation/screens/notification.dart';
import 'package:clickresturant/presentation/screens/offers.dart';
import 'package:clickresturant/presentation/widgets/single%20product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clickresturant/Core/constants/config.dart';
import 'package:clickresturant/logic/bloc/UserProfile/user_profile_bloc.dart';
import 'package:clickresturant/logic/bloc/productBloc/products_bloc.dart';
import 'package:clickresturant/presentation/screens/profile.dart';
import 'package:clickresturant/presentation/widgets/drawer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _keydrawer = GlobalKey<ScaffoldState>();
  int selectedIndex = 0;

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
      drawer: drawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CarouselSlider(
            items: [
              Card(
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage(""))),
                ),
              )
            ],
            options: CarouselOptions(
              height: 300,
            ),
          ),
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
            return const Center(
                child: Text(
              "Please check your internet connection",
              style: TextStyle(fontSize: 24),
            ));
          })),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
          if (index == 3) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => UserProfilePage()));

            context.read<UserProfileBloc>().add(LoadUserPRofile());
          }
          if (index == 2) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Offers()));
          }
          if (index == 1) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => NotificationScreen()));
          }
          if (index == 0) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const Home()));
          }
        },
        currentIndex: selectedIndex,
        selectedItemColor: thirdColor,
        selectedFontSize: 16,
        unselectedItemColor: primaryColor,
        showSelectedLabels: true,
        unselectedFontSize: 12,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ("Home")),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: ("Notifications")),
          BottomNavigationBarItem(
              icon: Icon(Icons.restaurant_menu), label: ("Offers")),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ("Profile")),
        ],
      ),
    );
  }
}
