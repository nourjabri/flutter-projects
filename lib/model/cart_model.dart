import 'package:statemangment_intro/model/product_model.dart';

class CartModel {
  List<ProductModel> products;
  double totalprice = 0;
  int id;
  CartModel({required this.id, required this.products});
}
