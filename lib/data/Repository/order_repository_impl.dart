import 'package:fashionproject/data/DataSource/orderDataSource.dart';
import 'package:fashionproject/domain/Entities/order_entity.dart';
import 'package:fashionproject/domain/Repositories/order_Repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderRemoteDataSource remoteDataSource;
 
  OrderRepositoryImpl(this.remoteDataSource);
  @override 
  Future<List<OrderEntity>> getMyOrders() async {
    final orders = await remoteDataSource.getMyOrder();
    return orders;
  }
}



