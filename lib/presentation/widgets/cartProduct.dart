import 'package:clickresturant/Core/constants/config.dart';
import 'package:clickresturant/data/model/product_model.dart';
import 'package:flutter/material.dart';

class Cartproduct extends StatelessWidget {
  final ProductModel product;

  const Cartproduct({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            product.proDec,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          "Price: ${product.proPrice}\$",
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: thirdColor,
          ),
        ),
      ],
    );
  }
}
