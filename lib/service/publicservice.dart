import 'package:serapp/model/publickhtma.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PublicKhtmaservice {
  final client = Supabase.instance.client;
  Future<List<PublicKhtma>> fetchPublicKhtma() async {
    final response = await client
        .from('public-khtma')
        .select()
        .order('created_at', ascending: false);
    return (response as List).map((item) => PublicKhtma.fromMap(item)).toList();
  }
}
