import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemangment_intro/Provider/cart_Provider.dart';
import 'package:statemangment_intro/model/product_model.dart';
import 'package:statemangment_intro/view/cart_page.dart';

class ProductPage extends StatelessWidget {
  ProductPage({super.key});
  List<ProductModel> products = [
    ProductModel(
      id: 1,
      name: "Mango",
      price: 25000,
      qty: 5,
      img:
          "https://www.torbayfruitsales.co.uk/wp-content/uploads/2023/05/mango3.jpg",
          rest_id: 1
    ),
    ProductModel(
      id: 2,
      name: "Lemon",
      price: 17000,
      qty: 3,
      img:
          "https://oasisonline.com.au/cdn/shop/products/lemons.jpg?v=1613482486",
          rest_id: 2
    ),
    ProductModel(
      id: 3,
      name: "Apple",
      price: 20000,
      qty: 10,
      img:
          "https://static.libertyprim.com/files/familles/pomme-large.jpg?1569271834",
          rest_id: 1
    ),
    ProductModel(
      id: 4,
      name: "Cherry",
      price: 35000,
      qty: 4,
      img:
          "https://5.imimg.com/data5/VJ/XF/MY-22541476/california-cherries-500x500.jpg",
          rest_id: 2
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => cartManger(),
      child: Consumer<cartManger>(
        builder: (context, cart, _) {
          return Scaffold(
            body: Column(
              children: [
                Text("Fruit App"),

                SizedBox(
                  height: 500,
                  child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder:
                        (context, index) => Card(
                          child: ExpansionTile(
                            title: Text(products[index].name),
                            children: [
                              ListTile(
                                title: Text(products[index].name),
                                onTap: () => cart.updateCart(products[index]),
                                trailing: Text(
                                  products[index].price.toString(),
                                ),
                                leading: CircleAvatar(
                                  child: Image.network(products[index].img),
                                ),
                              ),
                            ],
                          ),
                        ),
                  ),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (_) => ChangeNotifierProvider.value(
                          value: context.read<cartManger>(),
                          child: CartPage(),
                        ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
