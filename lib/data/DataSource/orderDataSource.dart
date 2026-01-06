import 'package:fashionproject/data/models/orderModel.dart';

abstract class OrderRemoteDataSource {
  Future<List<Ordermodel>> getMyOrder();
}
