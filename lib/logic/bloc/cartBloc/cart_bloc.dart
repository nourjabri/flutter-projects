import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:resturant_mang/data/model/cart_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial(items: [], totalPrice: 0.0)) {
    on<AddToCart>(_onAdd);
    on<RemoveFromCart>(_onRemove);
    on<UpdateQuantityCart>(_onUpdateQuantity);
    on<clearCartEvent>(_onClear);
    on<AddMultipleToCart>((event, emit) {
      emit(CartUpdated(items: event.items));
    });
    _loadCart();
  }

  void _onAdd(AddToCart event, Emitter<CartState> emit) {
    final current = state is CartUpdated
        ? List<CartItem>.from((state as CartUpdated).items)
        : <CartItem>[];

    final idx = current.indexWhere((e) => e.proId == event.item.proId);
    if (idx >= 0) {
      current[idx].quantity += event.item.quantity;
    } else {
      current.add(event.item);
    }
    emit(CartUpdated(items: current));
    saveCart(current);
  }

  void _onRemove(RemoveFromCart event, Emitter<CartState> emit) {
    final current = state is CartUpdated
        ? List<CartItem>.from((state as CartUpdated).items)
        : <CartItem>[];
    current.removeWhere((e) => e.proId == event.productId);
    emit(CartUpdated(items: current));
    saveCart(current);
  }

  void _onUpdateQuantity(UpdateQuantityCart event, Emitter<CartState> emit) {
    final current = state is CartUpdated
        ? List<CartItem>.from((state as CartUpdated).items)
        : <CartItem>[];
    final idx = current.indexWhere((e) => e.proId == event.productId);
    if (idx >= 0) {
      current[idx].quantity = event.quntity;
      if (current[idx].quantity <= 0) current.removeAt(idx);
    }
    emit(CartUpdated(items: current));
    saveCart(current);
  }

  void _onClear(clearCartEvent event, Emitter<CartState> emit) {
    emit(CartUpdated(items: []));
    saveCart([]);
  }

  Future<void> _loadCart() async {
    final prefs = await SharedPreferences.getInstance();
    final cartjson = prefs.getString('cartItems');
    if (cartjson != null) {
      final List<dynamic> decoded = jsonDecode(cartjson);
      final List<CartItem> loadedItems =
          decoded.map((item) => CartItem.fromJson(item)).toList();
      add(AddMultipleToCart(loadedItems));
    }
  }

  Future<void> saveCart(List<CartItem> items) async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = jsonEncode(items.map((e) => e.toJson()).toList());
    await prefs.setString('cartItems', encoded);
  }
}
