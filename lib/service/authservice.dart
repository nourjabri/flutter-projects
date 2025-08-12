
import 'package:audioapp/model/authModel.dart';
import 'package:dio/dio.dart';

class AuthService {
  Dio dioauth;

  AuthService({required this.dioauth});
  Future<AuthModel> checkauth(String email, String password) async {
    try {
      Response response = await dioauth.post(
        "https://school-managment-app-tqbh.onrender.com/admin/auth/login",
        data: {"username": email, "password": password},
      );
      print("Login Data:  ${response.data}");
      print(response.data);

      return AuthModel.fromMap(response.data);
    } catch (e) {
      print("failed to login:  $e");
      throw Exception("Login Failed");
    }
  }

  Future<AuthModel> refreshtokenservice(String refreshtoken) async {
    AuthModel authModelrefresh;
    Response response = await dioauth.post(
      "https://school-managment-app-tqbh.onrender.com/refresh",
      options: Options(headers: {'Authorization': 'Bearer$refreshtoken'}),
    );
    return AuthModel.fromMap(response.data);
  }
}
