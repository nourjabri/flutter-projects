import 'package:clickresturant/presentation/widgets/navBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clickresturant/Core/constants/config.dart';
import 'package:clickresturant/logic/bloc/cartBloc/cart_bloc.dart';
import 'package:clickresturant/presentation/screens/dilvery_detailes.dart';

class Shopping extends StatefulWidget {
  const Shopping({super.key});

  @override
  _ShoppingState createState() => _ShoppingState();
}

class _ShoppingState extends State<Shopping> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            "My Cart",
            style: TextStyle(
                fontSize: 20, color: fourColor, fontWeight: FontWeight.bold),
          ),
          elevation: 0.0,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios),
            color: Colors.black,
          ),
        ),
        body: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartInitial ||
                (state is CartUpdated && state.items.isEmpty)) {
              return const Center(
                child:
                    Text("Your cart is empty", style: TextStyle(fontSize: 20)),
              );
            }

            final items = state is CartUpdated ? state.items : [];
            final total = state is CartUpdated ? state.total : 0.0;

            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];

                      return Card(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 6),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              /// Product Image
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  item.proImage,
                                  width: 70,
                                  height: 70,
                                  fit: BoxFit.cover,
                                ),
                              ),

                              const SizedBox(width: 12),

                              /// Product Name + Price
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(item.proName,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold)),
                                    const SizedBox(height: 4),
                                    Text(
                                        "\$${item.proPrice.toStringAsFixed(2)}",
                                        style:
                                            const TextStyle(color: thirdColor)),
                                  ],
                                ),
                              ),

                              /// Quantity + Delete Buttons
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      /// decrease
                                      IconButton(
                                        icon: const Icon(
                                            Icons.remove_circle_outline),
                                        onPressed: () {
                                          if (item.quantity > 1) {
                                            context.read<CartBloc>().add(
                                                  UpdateQuantityCart(
                                                    productId: item.proId,
                                                    quntity:
                                                        (item.quantity - 1),
                                                  ),
                                                );
                                          }
                                        },
                                      ),

                                      Text(item.quantity.toString(),
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold)),

                                      /// increase
                                      IconButton(
                                        icon: const Icon(
                                            Icons.add_circle_outline),
                                        onPressed: () {
                                          context.read<CartBloc>().add(
                                                UpdateQuantityCart(
                                                  productId: item.proId,
                                                  quntity: (item.quantity + 1),
                                                ),
                                              );
                                        },
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete,
                                        color: Colors.red),
                                    onPressed: () {
                                      context.read<CartBloc>().add(
                                          RemoveFromCart(
                                              productId: item.proId));
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Total:",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                      Text(
                        "\$${total.toStringAsFixed(2)}",
                        style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: thirdColor),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 60,
                  decoration: BoxDecoration(
                    color: fourColor,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 1,
                        blurRadius: 4,
                        offset: Offset(0, 1),
                      )
                    ],
                  ),
                  child: GestureDetector(
                    onTap: () {
                      final cartBloc = BlocProvider.of<CartBloc>(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Checkout ")));
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BlocProvider.value(
                                    value: cartBloc,
                                    child: DilveryDetailes(),
                                  )));
                    },
                    child: Container(
                        height: 60,
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 10.0, bottom: 7.0),
                        decoration: BoxDecoration(
                            color: fourColor,
                            borderRadius: BorderRadius.circular(16)),
                        child: const Text(
                          "Continue",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: secondryColor,
                          ),
                        )),
                  ),
                ),
              ],
            );
          },
        ),
        bottomNavigationBar: const BottomBar());
  }
}
