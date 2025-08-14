import 'package:dio/dio.dart';

class haithService {
  String baseurl = "https://alhekmah-server-side.onrender.com/";
  final Dio dio = Dio();
  Future<List<dynamic>> getHadith() async {
    try {
      final response = await dio.get("");
      return response.data;
    } on DioException catch (e) {
      throw Exception("خطا في الاتصال :${e.message}");
    }
  }

  Future<Map<String, dynamic>> uploadAudio(String filepath) async {
    try {
      FormData formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(filepath,
            filename: filepath.split('/').last),
      });
      final response = await dio.post("path",
          data: formData, options: Options(contentType: 'multipart/form-data'));
      return response.data;
    } on DioException catch (e) {
      print("🔴 Dio Error: ${e.message}");
      if (e.response != null) {
        print("📥 Response status: ${e.response?.statusCode}");
        print("📥 Response data: ${e.response?.data}");
      }
      throw Exception("خطأ في رفع الملف: ${e.response?.data ?? e.message}");
    }
  }
}
