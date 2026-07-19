import 'package:dio/dio.dart';
import 'package:orbitproject/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServices {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://fakestoreapi.com",
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
    ),
  );

  String message = "";
  Future<void> signup({
    required String email,
    required String username,
    required String password,
  }) async {
    final user = UserModel(
      id: 0,
      email: email,
      password: password,
      username: username,
    );
    final response = await dio.post("/users", data: user.toJson());
    if (response.statusCode == 201) {
      return response.data;
    } else {
      throw Exception("failed to sign up");
    }
  }

  Future<String> login({
    required String username,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        "/auth/login",
        data: {"username": username, "password": password},
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        return response.data["token"];
      }
    } on DioException catch (e) {
      throw Exception("${e.response?.data}");
    }
    throw Exception("failed to login: ");
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("token");
  }
}
