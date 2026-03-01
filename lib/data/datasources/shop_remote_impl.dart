import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'shop_remotedataSource.dart';
import '../models/shop_model.dart';

class ShopRemoteDataSourceImpl implements ShopRemoteDataSource {
  final http.Client client;

  ShopRemoteDataSourceImpl(this.client);

  @override
  Future<List<ShopModel>> getShops() async {
    final response = await client.get(
      Uri.parse(
        dotenv.env['API_Link']!,
      ).replace(queryParameters: {'deviceKind': 'mobile'}),
      headers: {'secretKey': dotenv.env['secretKey']!},
    );

    if (response.statusCode == 200) {
      final decoded = json.decode(response.body);
      final List data = decoded['result'] as List<dynamic>;
      return data.map((e) => ShopModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load shops');
    }
  }
}
