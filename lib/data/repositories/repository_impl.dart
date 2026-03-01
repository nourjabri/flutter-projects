import 'package:quranapp/data/datasources/shop_remotedataSource.dart';
import 'package:quranapp/domain/entites/shop_entity.dart';
import 'package:quranapp/domain/repositories/shop_repository.dart';

import 'package:dartz/dartz.dart';

class ShopRepositoryImpl implements ShopRepository {
  final ShopRemoteDataSource remote;

  ShopRepositoryImpl(this.remote);

  @override
  Future<Either<String, List<ShopEntity>>> getShops() async {
    try {
      final models = await remote.getShops();

      final entities = models.map((e) => e.toEntity()).toList();

      return Right(entities);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
