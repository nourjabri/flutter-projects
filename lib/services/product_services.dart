import 'package:dio/dio.dart';
import 'package:orbitproject/models/product_model.dart';

class ProductServices {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://fakestoreapi.com",
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
    ),
  );

  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await dio.get("/products");
      if (response.statusCode == 200) {
        final List<ProductModel> products = List.generate(
          response.data.length,
          (index) => ProductModel.fromJson(response.data[index]),
        );
        return products;
      }
    } on DioException catch (e) {
      throw Exception(e.message);
    }
    throw Exception("faild to load products");
  }

  Future<ProductModel> getproduct(int id) async {
    try {
      final response = await dio.get("/products/$id");
      if (response.statusCode == 200) {
        ProductModel product = ProductModel.fromJson(response.data);
        print(product.id);
        return product;
      }
    } on DioException catch (e) {
      throw Exception(e.message);
    }
    throw Exception("failed to load one product");
  }

  Future<ProductModel> addProduct({
    required String title,
    required String description,
    required double price,
    required String category,
    required String image,
  }) async {
    final ProductModel newproduct = ProductModel(
      id: 0,
      title: title,
      price: price,
      description: description,
      category: category,
      image: image,
    );
    try {
      final response = await dio.post("/products", data: newproduct.toJson());
      if (response.statusCode == 201) {
        return ProductModel.fromJson(response.data);
      }
    } on DioException catch (e) {
      throw Exception(e.message);
    }
    throw Exception("failed to add product");
  }

  Future<ProductModel> editProduct(
    int id,
    String title,
    double price,
    String description,
    String image,
    String category,
  ) async {
    final ProductModel editproduct = ProductModel(
      id: id,
      title: title,
      price: price,
      description: description,
      category: category,
      image: image,
    );
    try {
      final respsonse = await dio.put(
        "/products/$id",
        data: editproduct.toJson(),
      );
      if (respsonse.statusCode == 200) {
        return ProductModel.fromJson(respsonse.data);
      }
      if (respsonse.statusCode == 400) {
        throw Exception("Cannot edit Product");
      }
    } on DioException catch (e) {
      throw Exception(e.message);
    }
    throw Exception("Please check your internet");
  }

  Future<ProductModel> deleteProduct(int id) async {
    try {
      final response = await dio.delete("/products/$id");
      final ProductModel deletedproduct = ProductModel.fromJson(response.data);
      if (response.statusCode == 200) {
        return deletedproduct;
      }
    } on DioException catch (e) {
      throw Exception(e.message);
    }
    throw Exception("faild to delete product");
  }
}
