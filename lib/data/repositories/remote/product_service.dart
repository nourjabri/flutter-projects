import 'package:dio/dio.dart';
import 'package:clickresturant/data/model/product_model.dart';

class ProductService {
  final Dio requestHandler;

  String baseUrl = "https://67c137a161d8935867e235b4.mockapi.io/products";

  ProductService({required this.requestHandler});

  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await requestHandler.get(baseUrl);

      print("RESPONSE: ${response.data}");
      print("TYPE: ${response.data.runtimeType}");

      if (response.statusCode == 200) {
        if (response.data is List) {
          final List data = response.data;

          return data.map((json) => ProductModel.fromJson(json)).toList();
        }

        // 👇 إذا رجع Map
        else if (response.data is Map) {
          final List data = response.data['data'] ?? [];

          return data.map((json) => ProductModel.fromJson(json)).toList();
        } else {
          throw Exception("Unexpected response format");
        }
      } else {
        throw Exception("Status code: ${response.statusCode}");
      }
    } catch (e) {
      print("🔥 SERVICE ERROR: $e");
      throw Exception(e.toString());
    }
  }
}
