import 'dart:io';

import 'package:dio/dio.dart';

class AudioService {
  final Dio dio = Dio();
  final String apikey = "c5401d1f53224447be9abe2dfeb065e0";
  Future<String?> auploadAudio(File audiofile) async {
    try {
      final response = await dio.post(
        "https://api.assemblyai.com/v2/upload",
        data: audiofile.openRead(),
        options: Options(
          headers: {'authorization': apikey, 'Transfer-Encoding': "chunked"},
        ),
      );
      if (response.statusCode == 200) {
        return response.data['upload_url'];
      } else {
        print("لم ينجح الرفع بسبب :${response.statusCode}");
      }
    } catch (e) {
      print('لم نستطع رفع الملف :$e');
      return null;
    }
  }

  Future<void> transcribeAudio(String audioUrl) async {
    final response = await dio.post(
      'https://api.assemblyai.com/v2/transcript',
      data: {'audio_url': audioUrl, 'language_code': 'ar'},
      options: Options(
        headers: {'authorization': apikey, 'content-type': 'application/json'},
      ),
    );

    if (response.statusCode == 200) {
      final transcriptId = response.data['id'];
      await pollTranscriptionResult(transcriptId);
    } else {
      print("فشل بدء التحويل: ${response.statusCode}");
    }
  }

  Future<void> pollTranscriptionResult(String id) async {
    String status = "";

    while (status != "completed" && status != "error") {
      await Future.delayed(Duration(seconds: 3));

      final response = await dio.get(
        'https://api.assemblyai.com/v2/transcript/$id',
        options: Options(headers: {'authorization': apikey}),
      );

      status = response.data['status'];

      if (status == "completed") {
        final text = response.data['text'];
        print("النص المحول: $text");
      } else {
        print("قيد المعالجة... الحالة: $status");
      }
    }

    if (status == "error") {
      print("حدث خطأ أثناء تحويل الصوت إلى نص");
    }
  }
}
