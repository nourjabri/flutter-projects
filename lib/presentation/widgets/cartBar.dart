import 'package:clickresturant/Core/constants/config.dart';
import 'package:clickresturant/presentation/screens/shopping_cart.dart';
import 'package:flutter/material.dart';

class CartAppBar extends StatelessWidget {
  const CartAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite, color: thirdColor)),
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Shopping()),
            );
          },
          icon: const Icon(
            Icons.shopping_cart,
          ),
        )
      ],
      title: const Text(
        "widget.proName",
        style: TextStyle(
            fontSize: 20, color: fourColor, fontWeight: FontWeight.bold),
      ),
      elevation: 0.0,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back_ios),
        color: Colors.black,
      ),
      foregroundColor: fourColor,
      backgroundColor: Colors.white,
    );
  }
}
