import 'package:fashionproject/domain/Entities/order_entity.dart';
import 'package:fashionproject/domain/Repositories/order_Repository.dart';

class Orderusecase {
  final OrderRepository repository;
  Orderusecase(this.repository);
  Future<List<OrderEntity>> call() {
    return repository.getMyOrders();
  }
}
