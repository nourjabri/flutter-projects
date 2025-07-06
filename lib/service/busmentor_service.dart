import 'dart:convert';
import 'package:adminapp/model/busmonetormddel.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BusMentorService {
  Dio dio = Dio();

  late Response response;

  Future<bool> creatementorservice(BusMonetorModel mentor) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("access_token");

    if (token == null) {
      throw Exception("Token not found");
    }

    try {
      final response = await dio.post(
        "https://school-managment-app-tqbh.onrender.com/admin/users/bus-mentor",
        data: mentor.toJson(),
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json",
          },
        ),
      );

      print("Bus Mentor created: ${response.data}");
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

  Future<BusMonetorModel?> getonementor(String id) async {
    try {
      response = await dio.get(
        "https://school-managment-app-tqbh.onrender.com/admin/users/bus-mentor" +
            id,
      );
      BusMonetorModel mentor = BusMonetorModel.fromMap(response.data);
      return mentor;
    } catch (e) {
      print("we can't get the mentor");
      print(e);
      return null;
    }
  }

  Future<List<BusMonetorModel>> getAllMentors() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("access_token");

    if (token == null) {
      throw Exception("Access token is missing");
    }

    try {
      final response = await dio.get(
        "https://school-managment-app-tqbh.onrender.com/admin/users/bus-mentors",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json",
          },
        ),
      );

      List<BusMonetorModel> mentorList = List.generate(
        response.data.length,
        (index) => BusMonetorModel.fromMap(response.data[index]),
      );

      return mentorList;
    } catch (e) {
      print("Error getting Mentors: $e");
      throw e;
    }
  }
}
