part of 'shop_cubit.dart';

@immutable
abstract class ShopState {}

class ShopInitial extends ShopState {}

class ShopLoading extends ShopState {}

class ShopLoaded extends ShopState {
  final List<ShopEntity> shops;
  ShopLoaded(this.shops);
  @override
  List<Object?> get props => [shops];
}

class ShopEmpty extends ShopState {}

class ShopError extends ShopState {
  final String message;
  ShopError(this.message);
}
