part of 'favorite_bloc.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}



class FavoriteInitial extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}

class FavoriteLoaded extends FavoriteState {
  final List<ProductModel> items;
  FavoriteLoaded(this.items);
}
class FavoriteEmpty extends FavoriteState{}

class FavoriteError extends FavoriteState {
  final String message;
  FavoriteError(this.message);
}
