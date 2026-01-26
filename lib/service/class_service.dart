import 'package:adminapp/model/TeacherClasses.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TeacherClassService {
  Dio dio = Dio();

  late Response response;

  Future<bool> createTeacherclass(TeacherClasses teacherclass) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("access_token");

    if (token == null) {
      throw Exception("Token not found");
    }

    try {
      final response = await dio.post(
        "https://school-managment-app-tqbh.onrender.com/admin/classes",
        data: teacherclass.toMap(),

        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json",
          },
        ),
      );
      print("teacherId = ${teacherclass.teacher_id}");

      print("class created: ${response.data}");
      return true;
    } catch (e) {
      if (e is DioException) {
        print("Dio Error ${e.response?.statusCode}: ${e.response?.data}");
        return false;
      } else {
        // print("Unexpected error: $e");
        rethrow;
      }
    }
  }

  Future<TeacherClasses> getoneteacherClass(String id) async {
    try {
      response = await dio.get(
        "https://school-managment-app-tqbh.onrender.com/admin/classes" + id,
      );
      TeacherClasses teacherClasses = TeacherClasses.fromMap(response.data);
      return teacherClasses;
    } catch (e) {
      print("we can't get the teacher class");
      print(e);
      throw Exception();
    }
  }

  Future<List<TeacherClasses>> getAllTeacherClassess() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("access_token");

    if (token == null) {
      throw Exception("Access token is missing");
    }

    try {
      final response = await dio.get(
        "https://school-managment-app-tqbh.onrender.com/admin/classes",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json",
          },
        ),
      );

      List<TeacherClasses> classesList = List.generate(
        response.data.length,
        (index) => TeacherClasses.fromMap(response.data[index]),
      );

      return classesList;
    } catch (e) {
      print("Error getting classes: $e");
      throw e;
    }
  }
}
