import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemangment_intro/Provider/cart_Provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<cartManger>(
      builder:
          (context, providerCart, child) => Scaffold(
            appBar: AppBar(title: Text("Fruit Cart")),
            body: Column(
              children: [
                Text(providerCart.getprice().toString()),
                ExpansionTile(
                  title: Text("your cart components"),
                  children: [
                    SizedBox(
                      height: 300,
                      child: ListView.builder(
                        itemCount: providerCart.cart.products.length,
                        itemBuilder:
                            (context, index) => ListTile(
                              leading: CircleAvatar(
                                child: Image.network(
                                  providerCart.cart.products[index].img,
                                ),
                              ),
                              trailing: Text(
                                providerCart.cart.products[index].qty
                                    .toString(),
                              ),
                              title: Text(
                                providerCart.cart.products[index].name,
                              ),
                              subtitle: Text(
                                providerCart.cart.products[index].price
                                    .toString(),
                              ),
                            ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
    );
  }
}
