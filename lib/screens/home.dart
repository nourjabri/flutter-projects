import 'package:flutter/material.dart';
import 'package:orbitproject/providers/auth_provider.dart';
import 'package:orbitproject/providers/product_provider.dart';
import 'package:orbitproject/screens/login_screen.dart';
import 'package:orbitproject/screens/product_details.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<ProductProvider>().getProducts());
  }

  int id = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              _logout(context);
            },
            icon: Icon(Icons.logout),
          ),
        ],
        title: Text(
          "Orbit Store",
          style: TextStyle(
            color: Color(0xff9384D1),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Consumer<ProductProvider>(
            builder: (BuildContext context, provider, child) {
              if (provider.isLoading) {
                return Shimmer.fromColors(
                  baseColor: Color(0xffFFDCB6),
                  highlightColor: Color(0xffECC9EE),
                  period: Duration(microseconds: 600),
                  enabled: true,
                  child: Center(child: CircularProgressIndicator()),
                );
              }
              return Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: provider.products.length,
                  itemBuilder: (context, index) {
                    final product = provider.products[index];
                    return InkWell(
                      splashColor: Color(0xffFFDCB6),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ProductDetails(productId: product.id),
                          ),
                        );
                      },
                      child: Card(
                        child: ListTile(
                          leading: Hero(
                            tag: product.id,
                            child: Image.network(
                              product.image,
                              errorBuilder: (context, error, stackTrace) =>
                                  Icon(Icons.broken_image),
                              width: 50,
                              height: 50,
                            ),
                          ),
                          title: Text(product.title),
                          subtitle: Text("price: \$${product.price}"),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void _logout(BuildContext context) async {
    await Provider.of<AuthProvider>(context, listen: false).logout();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => Loginscreen()),
      (route) => false,
    );
  }
}
