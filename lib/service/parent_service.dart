import 'package:dio/dio.dart';
import 'package:adminapp/model/parent_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ParentService {
  Dio dio = Dio();

  late Response response;

  Future<bool> CreateNewParent(ParentModel parent) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("access_token");
    if (token == null) {
      throw Exception("tokn not found");
    }
    try {
      final response = await dio.post(
        "https://school-managment-app-tqbh.onrender.com/admin/users/parent",
        data: parent.toJson(),
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json",
          },
        ),
      );
      print(response.data);
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

  Future<List<ParentModel>> GethAllParents() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("access_token");

    if (token == null) {
      throw Exception("Token not found");
    }
    try {
      final response = await dio.get(
        "https://school-managment-app-tqbh.onrender.com/admin/users/parents",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json",
          },
        ),
      );
      List<ParentModel> parentList = List.generate(
        response.data.length,
        (index) => ParentModel.fromMap(response.data[index]),
      );
      return parentList;
    } catch (e) {
      print("Error getting Parents: $e");
      throw e;
    }
  }
}
