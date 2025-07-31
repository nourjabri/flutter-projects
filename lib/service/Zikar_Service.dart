import 'package:serapp/model/Zikar_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:dio/dio.dart';

class PubliczikarService {
  late Response response;
  final client = Supabase.instance.client;
  Future<void> addPublicService({
    required String niyyah,
    required DateTime start_date,
    required DateTime end_date,
    required int qty_done,
    required int qty_suppose,
  }) async {
    await Supabase.instance.client
        .from('publiczikar')
        .insert({
          'niyyah': niyyah,
          'start_date': start_date.toString(),
          'end_date': end_date.toString(),
          'qty_done': qty_done,
          'qty_suppose': qty_suppose,
        })
        .select()
        .single();
  }

  Future<List<PublicZikar>> fetchPublicZikar() async {
    final response = await client
        .from('publiczikar')
        .select()
        .order('created_at', ascending: false);
    return (response as List).map((item) => PublicZikar.fromMap(item)).toList();
  }
}
