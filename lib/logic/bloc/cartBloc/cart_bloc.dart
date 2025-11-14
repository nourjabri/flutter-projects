import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:resturant_mang/data/model/cart_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<AddToCart>(_onAdd);
    on<RemoveFromCart>(_onRemove);
    on<UpdateQuantityCart>(_onUpdateQuantity);
    on<clearCartEvent>(_onClear);
  }

  void _onAdd(AddToCart event, Emitter<CartState> emit) {
    final current = state is CartUpdated
        ? List<CartItem>.from((state as CartUpdated).items)
        : <CartItem>[];

    final idx = current.indexWhere((e) => e.id == event.item.id);
    if (idx >= 0) {
      current[idx].quantity += event.item.quantity;
    } else {
      current.add(event.item);
    }
    emit(CartUpdated(items: current));
  }

  void _onRemove(RemoveFromCart event, Emitter<CartState> emit) {
    final current = state is CartUpdated
        ? List<CartItem>.from((state as CartUpdated).items)
        : <CartItem>[];
    current.removeWhere((e) => e.id == event.productId);
    emit(CartUpdated(items: current));
  }

  void _onUpdateQuantity(UpdateQuantityCart event, Emitter<CartState> emit) {
    final current = state is CartUpdated
        ? List<CartItem>.from((state as CartUpdated).items)
        : <CartItem>[];
    final idx = current.indexWhere((e) => e.id == event.productId);
    if (idx >= 0) {
      current[idx].quantity = event.quntity as int;
      if (current[idx].quantity <= 0) current.removeAt(idx);
    }
    emit(CartUpdated(items: current));
  }

  void _onClear(clearCartEvent event, Emitter<CartState> emit) {
    emit(CartUpdated(items: []));
  }
}
