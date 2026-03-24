import 'package:dio/dio.dart';
import 'package:clickresturant/data/model/product_model.dart';

class ProductService {
  final Dio requestHandler;

  String baseUrl = "https://67c137a161d8935867e235b4.mockapi.io/products";

  ProductService({required this.requestHandler});

  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await requestHandler.get(baseUrl);

      if (response.statusCode == 200) {
        List data = response.data;

        return data.map((json) => ProductModel.fromJson(json)).toList();
      } else {
        throw Exception("Failed to load products");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}
