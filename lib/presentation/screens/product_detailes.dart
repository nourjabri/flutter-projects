import 'package:clickresturant/data/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clickresturant/Core/constants/config.dart';
import 'package:clickresturant/data/model/cart_model.dart';
import 'package:clickresturant/data/model/favorite.dart';
import 'package:clickresturant/logic/bloc/cartBloc/cart_bloc.dart';
import 'package:clickresturant/presentation/screens/shopping_cart.dart';

class ProductsDetail extends StatefulWidget {
  final ProductModel product;
  ProductsDetail({required this.product});

  @override
  _ProductsDetailState createState() => _ProductsDetailState();
}

class _ProductsDetailState extends State<ProductsDetail> {
  int qty = 1;
  List<FavoriteModel> favorite = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
        ),
        centerTitle: true,
        title: Text(
          widget.product.proName,
          style: TextStyle(color: primaryColor),
        ),
      ),
      // appBar: PreferredSize(
      //     preferredSize: Size(MediaQuery.sizeOf(context).width, 50),
      //     child: CartAppBar()),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              widget.product.proImage,
              height: 240,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.product.proDec,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            textAlign: TextAlign.center,
            "Price: ${widget.product.proPrice}\$",
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: thirdColor,
            ),
          ),
          Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                height: 70,
                child: Expanded(
                  child: GestureDetector(
                    onTap: () {
                      final item = CartItem(
                        proId: widget.product.proId,
                        proName: widget.product.proName,
                        proPrice: widget.product.proPrice,
                        quantity: qty,
                        proImage: widget.product.proImage,
                      );

                      context.read<CartBloc>().add(AddToCart(item));

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text(
                                "${widget.product.proName} added x$qty to cart")),
                      );
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Shopping()));
                    },
                    child: Container(
                        height: 60,
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 10.0, bottom: 7.0),
                        decoration: BoxDecoration(
                            color: fourColor,
                            borderRadius: BorderRadius.circular(16)),
                        child: const Text(
                          "Add To Cart",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: secondryColor,
                          ),
                        )),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
