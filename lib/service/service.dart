import 'dart:io';

import 'package:dio/dio.dart';

Future<String?> uploadAndTranscribe(String filePath) async {
  const apiKey = 'c5401d1f53224447be9abe2dfeb065e0';
  final dio = Dio();

  try {
    final uploadResponse = await dio.post(
      'https://api.assemblyai.com/v2/upload',
      data: File(filePath).openRead(),
      options: Options(
        headers: {
          'Authorization': apiKey,
          'Transfer-Encoding': 'chunked',
        },
      ),
    );

    final uploadUrl = uploadResponse.data['upload_url'];
    print("رابط الصوت: $uploadUrl");

    final transcriptResponse = await dio.post(
      'https://api.assemblyai.com/v2/transcript',
      data: {
        'audio_url': uploadUrl,
        'language_code': 'ar',
      },
      options: Options(
        headers: {'Authorization': apiKey},
      ),
    );

    final transcriptId = transcriptResponse.data['id'];
    print("رقم التفريغ: $transcriptId");

    while (true) {
      final pollingResponse = await dio.get(
        'https://api.assemblyai.com/v2/transcript/$transcriptId',
        options: Options(
          headers: {'Authorization': apiKey},
        ),
      );

      final status = pollingResponse.data['status'];
      if (status == 'completed') {
        return pollingResponse.data['text'];
      } else if (status == 'error') {
        print(" فشل التفريغ: ${pollingResponse.data['error']}");
        return null;
      }

      await Future.delayed(const Duration(seconds: 3));
    }
  } catch (e) {
    print(" خطأ أثناء الرفع: $e");
    return null;
  }
}
