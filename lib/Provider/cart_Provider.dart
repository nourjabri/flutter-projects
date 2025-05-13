import 'package:flutter/material.dart';
import 'package:statemangment_intro/model/cart_model.dart';
import 'package:statemangment_intro/model/product_model.dart';

class cartManger extends ChangeNotifier {
  CartModel cart = CartModel(id: 1, products: []);
  updateCart(ProductModel product) {
    if (cart.products.contains(product)) {
      int i = cart.products.indexOf(product);
      cart.products[i].qty++;
    } else {
      cart.products.add(product);
    }
    notifyListeners();
  }

  double getprice() {
    for (var i = 0; i < cart.products.length; i++) {
      cart.totalprice =
          cart.totalprice + cart.products[i].price * cart.products[i].qty;
    }
    return cart.totalprice; 
  }
}
