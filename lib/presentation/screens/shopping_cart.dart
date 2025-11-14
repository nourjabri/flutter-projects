import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:resturant_mang/Core/constants/config.dart';

class Shopping extends StatefulWidget {
  @override
  _ShoppingState createState() => _ShoppingState();
}

class _ShoppingState extends State<Shopping> {
  var myProducts = [
    {
      "Pro_id": "1",
      "Pro_name": "cheese cake",
      "Pro_price": "30",
      "Pro_image": "assets/images/products/1.jpg",
      "Pro_Qty": "7",
    },
    {
      "Pro_id": "2",
      "Pro_name": "crep",
      "Pro_price": "40",
      "Pro_image": "assets/images/products/2.jpg",
      "Pro_Qty": "1",
    },
    {
      "Pro_id": "3",
      "Pro_name": "cakes",
      "Pro_price": "15",
      "Pro_image": "assets/images/products/3.jpg",
      "Pro_Qty": "3",
    },
    {
      "Pro_id": "3",
      "Pro_name": "cakes",
      "Pro_price": "15",
      "Pro_image": "assets/images/products/3.jpg",
      "Pro_Qty": "3",
    },
    {
      "Pro_id": "3",
      "Pro_name": "cakes",
      "Pro_price": "15",
      "Pro_image": "assets/images/products/3.jpg",
      "Pro_Qty": "3",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: thirdColor,
                ))
          ],
        ),
        body: Expanded(
          child: ListView(
            children: [
              ListView.builder(
                  itemCount: myProducts.length,
                  itemBuilder: (context, index) {
                    return SingleProduct(
                        proId: myProducts[index]["Pro_id"]!,
                        proName: myProducts[index]["Pro_name"]!,
                        proImage: myProducts[index]["Pro_image"]!,
                        proPrice: myProducts[index]["Pro_price"]!,
                        proQty: myProducts[index]["Pro_Qty"]!);
                  }),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Total Price",
                    style: TextStyle(fontSize: 24),
                  ),
                  Text("Pro_price", style: TextStyle(fontSize: 18)),
                ],
              )
            ],
          ),
        ),
        bottomNavigationBar: Container(
          alignment: Alignment.center,
          child: GestureDetector(
            onTap: () {},
            child: Text("Continue",
                style: TextStyle(color: Colors.black, fontSize: 24)),
          ),
          height: 50,
          decoration: BoxDecoration(
              color: fourColor,
              boxShadow: [
                const BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: Offset(0, 1),
                )
              ],
              borderRadius: BorderRadius.circular(18)),
        ),
      ),
    );
  }
}

class SingleProduct extends StatelessWidget {
  final String proId;
  final String proName;
  final String proPrice;
  final String proQty;
  final String proImage;
  SingleProduct(
      {required this.proId,
      required this.proName,
      required this.proImage,
      required this.proPrice,
      required this.proQty});

  @override
  Widget build(BuildContext context) {
    return  ListTile(
      title: Text(
        proName,
        style: const TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(proPrice),
      leading: Container(
        width: 50,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(proImage),
            fit: BoxFit.cover,
          ),
          shape: BoxShape.circle,
        ),
      ),
      trailing: SizedBox(
        width: 150,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              child: const FaIcon(
                FontAwesomeIcons.plus,
                color: fourColor,
              ),
            ),
            Text(proQty),
            GestureDetector(
              child: const FaIcon(
                FontAwesomeIcons.minus,
                color: fourColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
