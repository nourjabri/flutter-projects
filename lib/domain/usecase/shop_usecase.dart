import 'package:dartz/dartz.dart';
import 'package:quranapp/domain/entites/shop_entity.dart';
import 'package:quranapp/domain/repositories/shop_repository.dart';

class GetShopsUseCase {
  final ShopRepository repository;

  GetShopsUseCase(this.repository);

  Future<Either<String, List<ShopEntity>>> call() {
    return repository.getShops();
  }
}
