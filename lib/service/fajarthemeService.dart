import 'package:dio/dio.dart';

class PrayerTimeService {
  final Dio dio = Dio();

  Future<DateTime?> getFajrTime(double latitude, double longitude) async {
    try {
      final response = await dio.get(
        'http://api.aladhan.com/v1/timings',
        queryParameters: {
          'latitude': latitude,
          'longitude': longitude,
          'method': 2, // طريقة الحساب
        },
      );

      final fajrTimeStr = response.data['data']['timings']['Fajr']; // "04:22"
      final parts = fajrTimeStr.split(':');
      final now = DateTime.now();
      return DateTime(now.year, now.month, now.day, int.parse(parts[0]), int.parse(parts[1]));
    } catch (e) {
      print('Error getting Fajr time: $e');
      return null;
    }
  }
}
