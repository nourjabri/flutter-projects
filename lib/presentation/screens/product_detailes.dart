import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resturant_mang/Core/constants/config.dart';
import 'package:resturant_mang/data/model/cart_model.dart';
import 'package:resturant_mang/logic/bloc/cartBloc/cart_bloc.dart';

class ProductsDetail extends StatefulWidget {
  final String proId;
  final String proName;
  final String proDec;
  final String proImg;
  final double price;

  ProductsDetail({
    required this.proId,
    required this.proName,
    required this.proDec,
    required this.proImg,
    required this.price,
  });

  @override
  _ProductsDetailState createState() => _ProductsDetailState();
}

class _ProductsDetailState extends State<ProductsDetail> {
  int qty = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        height: 70,
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8)),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (qty > 1) qty--;
                      });
                    },
                    icon: const Icon(Icons.remove),
                  ),
                  Text(qty.toString(), style: const TextStyle(fontSize: 18)),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        qty++;
                      });
                    },
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            // Add to cart button
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: fourColor),
                onPressed: () {
                  final item = CartItem(
                    id: widget.proId,
                    name: widget.proName,
                    price: widget.price,
                    quantity: qty,
                    img: widget.proImg,
                    image: '',
                  );
                  context.read<CartBloc>().add(AddToCart(item));

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text("${widget.proName} added x$qty to cart")),
                  );
                },
                child: Text(
                    "Add to cart  |  \$${(widget.price * qty).toStringAsFixed(2)}"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
