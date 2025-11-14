part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}

class CartUpdated extends CartState {
  final List<CartItem> items;
  final double total;

  CartUpdated({required this.items})
      : total = items.fold(0.0, (sum, it) => sum + it.total);

  @override
  List<Object> get props => [items, total];
}
