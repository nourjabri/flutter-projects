part of 'order_cubit.dart';

@immutable
abstract class OrderState {}

class OrderInitial extends OrderState {}

class OrderLoading extends OrderState {}

class OrderLoaded extends OrderState {
  final List<OrderEntity> orders;
  OrderLoaded(this.orders);
}

class OrderEmpty extends OrderState {}

class OrderError extends OrderState {
  final String message;
  OrderError(this.message);
}
