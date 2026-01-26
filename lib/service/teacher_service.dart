import 'package:adminapp/model/TeacherModel.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TeacherService {
  Dio dio = Dio();

  late Response response;

  Future<bool> createNewTeacher(TeacherModel teacher) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("access_token");

    if (token == null) {
      throw Exception("Token not found");
    }

    try {
      final response = await dio.post(
        "https://school-managment-app-tqbh.onrender.com/admin/users/teacher",
        data: teacher.toJson(),
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json",
          },
        ),
      );

      print("Teacher created: ${response.data}");
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

  Future<TeacherModel?> getoneteacher(String id) async {
    try {
      response = await dio.get(
        "https://school-managment-app-tqbh.onrender.com/admin/users/teacher" +
            id,
      );
      TeacherModel teacher = TeacherModel.fromMap(response.data);
      return teacher;
    } catch (e) {
      debugPrint("we can't get the teacher");
      // print(e);
      return null;
    }
  }

  Future<List<TeacherModel>> getAllTeachers() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("access_token");

    if (token == null) {
      throw Exception("Access token is missing");
    }

    try {
      final response = await dio.get(
        "https://school-managment-app-tqbh.onrender.com/admin/users/teachers",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json",
          },
        ),
      );

      List<TeacherModel> teacherList = List.generate(
        response.data.length,
        (index) => TeacherModel.fromMap(response.data[index]),
      );

      return teacherList;
    } catch (e) {
      print("Error getting teachers: $e");
      throw e;
    }
  }
}
