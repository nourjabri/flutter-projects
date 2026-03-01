import 'package:quranapp/data/models/shop_model.dart';

abstract class ShopRemoteDataSource {
  Future<List<ShopModel>> getShops(); 
}
