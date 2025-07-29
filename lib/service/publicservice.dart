import 'package:serapp/model/publickhtma.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:dio/dio.dart';

class PublicKhtmaservice {
  late Response response;
  final client = Supabase.instance.client;
  Future<void> addPublicKhatma({
    required String niyyah,
    required DateTime startDate,
    required DateTime endDate,
    required int peopleCount,
    required bool isFajria,
  }) async {
    await Supabase.instance.client.from('public_khatmas').insert({
      'niyyah': niyyah,
      'start_date': startDate.toString(),
      'end_date': endDate.toString(),
      'people_count': peopleCount,
      'is_fajria': isFajria,
    });
  }

  Future<List<PublicKhtma>> fetchPublicKhtma() async {
    final response = await client
        .from('public_khatmas')
        .select()
        .order('created_at', ascending: false);
    return (response as List).map((item) => PublicKhtma.fromMap(item)).toList();
  }
}
