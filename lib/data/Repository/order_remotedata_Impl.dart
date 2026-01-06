import 'package:dio/dio.dart';
import 'package:fashionproject/data/DataSource/orderDataSource.dart';
import 'package:fashionproject/data/models/orderModel.dart';

class OrderRemoteDataSourceImpl implements OrderRemoteDataSource {
  final Dio dio;
  OrderRemoteDataSourceImpl(this.dio);
  @override
  Future<List<Ordermodel>> getMyOrder() async {
    final response = await dio.get("path");
    final List data = response.data;
    return data.map((e) => Ordermodel.fromJson(e)).toList();
  }
}
