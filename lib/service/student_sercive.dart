import 'package:adminapp/model/studentmodel.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StundetService {
  Dio dio = Dio();

  late Response response;

  Future<bool> createNewStudent(StudentModel student) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("access_token");

    if (token == null) {
      throw Exception("Token not found");
    }

    try {
      final response = await dio.post(
        "https://school-managment-app-tqbh.onrender.com/admin/students",
        data: student.toJson(),
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json",
          },
        ),
      );

      print("Student created: ${response.data}");
      return true;
    } catch (e) {
      if (e is DioException) {
        print("Dio Error ${e.response?.statusCode}: ${e.response?.data}");
        return false;
      } else {
        print("Unexpected error: $e");
        rethrow;
      }
    }
  }

  Future<List<StudentModel>> getAllStudents() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("access_token");

    if (token == null) {
      throw Exception("Access token is missing");
    }

    try {
      final response = await dio.get(
        "https://school-managment-app-tqbh.onrender.com/admin/students",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json",
          },
        ),
      );

      List<StudentModel> studentList = List.generate(
        response.data.length,
        (index) => StudentModel.fromMap(response.data[index]),
      );
    

      return studentList;
    } catch (e) {
   
      throw e;
    }
  }

  Future<bool> updateStudent(int id, Map<String, dynamic> data) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("access_token");

    if (token == null) throw Exception("Token not found");

    try {
      final response = await dio.patch(
        "https://school-managment-app-tqbh.onrender.com/admin/students/$id/fees",
        data: data,
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json",
          },
        ),
      );

      // print("Student updated: ${response.data}");
      return true;
    } catch (e) {
      if (e is DioException) {
        // print("Dio Error ${e.response?.statusCode}: ${e.response?.data}");
        return false;
      } else {
        // print("Unexpected error: $e");
        rethrow;
      }
    }
  }
}
