import 'package:dio/dio.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PrivateKhtmaservice {
  late Response response;
  final client = Supabase.instance.client;
  Future<void> addPrivateKhatma({
    required String niyyah,
    required DateTime startDate,
    required DateTime endDate,

    required bool isFajria,
  }) async {
    await Supabase.instance.client.from('privatekhtma').insert({
      'niyyah': niyyah,
      'start_date': startDate.toString(),
      'end_date': endDate.toString(),
      'is_fajria': isFajria,
    });
  }
}
