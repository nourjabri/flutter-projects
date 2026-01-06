import 'package:fashionproject/domain/Entities/order_entity.dart';

abstract class OrderRepository {
  Future<List<OrderEntity>> getMyOrders();
}
