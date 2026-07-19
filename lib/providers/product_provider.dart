import 'package:flutter/material.dart';
import 'package:orbitproject/models/product_model.dart';
import 'package:orbitproject/services/product_services.dart';

class ProductProvider extends ChangeNotifier {
  bool isLoading = false;
  List<ProductModel> products = [];
  String? errormessage = "";
  int id = 0;
  final ProductServices productServices = ProductServices();
  ProductModel? productModel;
  Future<List<ProductModel>> getProducts() async {
    try {
      isLoading = true;
      errormessage = null;
      notifyListeners();
      products = await productServices.getProducts();
      this.products = products;
      isLoading = false;
      notifyListeners();
      return products;
    } catch (e) {
      isLoading = false;
      errormessage = e.toString();
      notifyListeners();
      throw Exception(e.toString());
    }
  }

  Future<ProductModel> getproduct(int id) async {
    try {
      isLoading = true;
      notifyListeners();
      productModel = await productServices.getproduct(id);
      isLoading = false;
      notifyListeners();
      return productModel!;
    } catch (e) {
      isLoading = false;
      notifyListeners();
      throw Exception(e.toString());
    }
  }
}
