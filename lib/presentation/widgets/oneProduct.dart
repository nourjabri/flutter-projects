import 'package:clickresturant/Core/constants/config.dart';
import 'package:clickresturant/data/model/product_model.dart';
import 'package:clickresturant/presentation/screens/product_detailes.dart';
import 'package:clickresturant/presentation/screens/shopping_cart.dart';
import 'package:flutter/material.dart';

class Oneproduct extends StatelessWidget {
  final ProductModel product;
  const Oneproduct({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductsDetail(
                      product: product,
                    )),
          );
        },
        child: Column(
            verticalDirection: VerticalDirection.down,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  product.proImage,
                  height: 240,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Shopping()),
                          );
                        },
                        icon: Icon(
                          Icons.shopping_basket_rounded,
                          color: primaryColor,
                        )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        product.proName,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ))
                  ],
                ),
              )
            ]),
      ),
    );
  }
}
