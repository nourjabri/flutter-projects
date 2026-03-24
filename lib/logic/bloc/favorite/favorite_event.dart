part of 'favorite_bloc.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}


class LoadFavorites extends FavoriteEvent {}

class AddToFavorite extends FavoriteEvent {
  final ProductModel product;
  AddToFavorite(this.product);
}

class RemoveFromFavorite extends FavoriteEvent {
  final String productId;
  RemoveFromFavorite(this.productId);
}

