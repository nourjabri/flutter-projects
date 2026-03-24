part of 'cart_bloc.dart';

sealed class CartState extends Equatable {
  CartState();

  @override
  List<Object> get props => [];
  
}

class CartInitial extends CartState {
  final List<CartItem> items;
  final double totalPrice;
  CartInitial({required this.items, required this.totalPrice});
}

class CartUpdated extends CartState {
  final List<CartItem> items;
  final double total;

  CartUpdated({required this.items})
      : total = items.fold(0.0, (sum, it) => sum + it.total);

  @override
  List<Object> get props => [items, total];
}
