import 'package:dio/dio.dart';
import 'package:fashionproject/data/DataSource/orderDataSource.dart';
import 'package:fashionproject/data/Repository/order_remotedata_Impl.dart';
import 'package:fashionproject/data/Repository/order_repository_impl.dart';
import 'package:fashionproject/domain/Repositories/order_Repository.dart';
import 'package:fashionproject/domain/useCase/orderUseCase.dart';

// Initialize Dio
final Dio dio = Dio();

// Initialize OrderRemoteDataSource
final OrderRemoteDataSource orderRemoteDataSource = OrderRemoteDataSourceImpl(
  dio,
);

// Initialize OrderRepository
final OrderRepository orderRepository = OrderRepositoryImpl(
  orderRemoteDataSource,
);

// Initialize Orderusecase
final Orderusecase orderusecase = Orderusecase(orderRepository);
