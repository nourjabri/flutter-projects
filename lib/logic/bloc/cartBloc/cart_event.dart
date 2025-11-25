part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class AddToCart extends CartEvent {
  final CartItem item;
  AddToCart(this.item);
  @override
  List<Object> get props => [item];
}

class RemoveFromCart extends CartEvent {
  final String productId;
  RemoveFromCart({required this.productId});
  @override
  List<Object> get props => [productId];
}

class UpdateQuantityCart extends CartEvent {
  final String productId;
  final int  quntity;
  UpdateQuantityCart({required this.productId, required this.quntity});
  @override
  List<Object> get props => [productId, quntity];
}

class clearCartEvent extends CartEvent {}

class AddMultipleToCart extends CartEvent {
  final List<CartItem> items;
  AddMultipleToCart(this.items); 
}
