import 'package:audioapp/model/StudentModel.dart';
import 'package:audioapp/model/authModel.dart';
import 'package:dio/dio.dart';

class AuthService {
  Dio dioauth;

  AuthService({required this.dioauth});
  Future<AuthModel> checkauth(String email, String password) async {
    try {
      Response response = await dioauth.post(
        "https://alhekmah-server-side.onrender.com/auth/login",
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

  Future<bool> createNewStudent(Studentmodel student) async {
    String registerurl =
        "https://alhekmah-server-side.onrender.com/auth/register";

    try {
      Response registerResponse = await dioauth.post(
        registerurl,
        data: student.toMap(),
      );

      print("Status Code: ${registerResponse.statusCode}");
      print("Response Data: ${registerResponse.data}");

      // التحقق إذا العملية نجحت فعلاً
      if (registerResponse.statusCode == 200 ||
          registerResponse.statusCode == 201) {
        return true;
      } else {
        // السيرفر رجع حالة فشل
        return false;
      }
    } on DioException catch (e) {
      // طباعة تفاصيل الخطأ من السيرفر
      if (e.response != null) {
        print("Error Status Code: ${e.response?.statusCode}");
        print("Error Data: ${e.response?.data}");
      } else {
        print("Error Message: ${e.message}");
      }
      return false;
    } catch (e) {
      print("Unexpected Error: $e");
      return false;
    }
  }
}
