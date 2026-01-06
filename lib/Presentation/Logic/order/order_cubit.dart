import 'package:bloc/bloc.dart';
import 'package:fashionproject/domain/Entities/order_entity.dart';
import 'package:fashionproject/domain/useCase/orderUseCase.dart';
import 'package:meta/meta.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final Orderusecase orderusecase;
  OrderCubit({required this.orderusecase}) : super(OrderInitial());
  Future<void> getOrders() async {
    emit(OrderLoading());

    try {
      final List<OrderEntity> orders = await orderusecase();

      if (orders.isEmpty) {
        emit(OrderEmpty());
      } else {
        emit(OrderLoaded(orders));
      }
    } catch (e) {
      emit(OrderError("Failed to load orders"));
    }
  }
}
