import 'package:flutter/material.dart';
import 'package:orbitproject/providers/product_provider.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {
  final int productId;
  const ProductDetails({required this.productId, super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<ProductProvider>().getproduct(widget.productId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Expanded(
          child: Consumer<ProductProvider>(
            builder: (context, provider, child) {
              if (provider.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (provider.errormessage != null) {
                return Center(child: Text(provider.errormessage!));
              }
              if (provider.productModel == null) {
                return Center(child: Text("No Product"));
              }
              final product = provider.productModel!;
              return Center(
                child: ListView(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Hero(
                        
                        tag: product.id,
                        child: Image.network(
                          product.image,
                          errorBuilder: (context, error, stackTrace) =>
                              Icon(Icons.broken_image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 50)),
                    AnimatedOpacity(
                      opacity: provider.isLoading ? 0.0 : 1.0,
                      duration: Duration(milliseconds: 500),
                      child: Text(
                        product.title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffECC9EE),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(product.description),
                    SizedBox(height: 20),
                    Text(
                      "Price:${product.price.toString()}",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
