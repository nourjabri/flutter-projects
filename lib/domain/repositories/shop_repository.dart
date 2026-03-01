import 'package:dartz/dartz.dart';
import 'package:quranapp/domain/entites/shop_entity.dart';

abstract class ShopRepository {
  Future<Either<String, List<ShopEntity>>> getShops();
}
